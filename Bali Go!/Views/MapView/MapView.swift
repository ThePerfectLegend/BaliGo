//
//  MapView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 11.08.2021.
//  Вью в которую приходит массив для отображения элементов на карте


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    
    /// ходим за аннотациями к карте
    @EnvironmentObject var mapData: MapViewModel
    /// откисовываем все элементы на карте которые переданы сюда /// @Binding
    var landmarksForDisplay: [Landmark]
    /// логика для выбранного элемента
    @Binding var selectedPlace: MapViewModel.LandmarkAnnotation?
    /// Главная локация,  должна дублироваться в массиве landmarksForDisplay, используется только для центрирования карты по ее координатам
    var landmark: Landmark?
    var showsUserLocation: Bool
    var userInteraction: Bool
    
    /// тип карты
    @EnvironmentObject var mapTypes: RouteModel
    var checkingMapType: MKMapType {
        switch mapTypes.mapType {
        case .standard:
            return .standard
        case .satelliteFlyover:
            return .hybridFlyover
        }
    }
    
    
    private var region: MKCoordinateRegion {
        if let unwrapCoordinates = landmark {
            /// если передали Главную локацию, то центрируемся на ней
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: unwrapCoordinates.latitude, longitude: unwrapCoordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 1.5))
            /// если нет, то центрируемся на острове
        } else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -8.5, longitude: 115.0701),
                                      span: MKCoordinateSpan(latitudeDelta: 1.4, longitudeDelta: 1.3))
        }
    }
        
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? MapViewModel.LandmarkAnnotation else { return nil }


            switch annotation.type {
            case .Culture:
                return CultureAnnotationView(annotation: annotation, reuseIdentifier: CultureAnnotationView.ReuseID)
            case .Waterfalls:
                return WaterfallAnnotationView(annotation: annotation, reuseIdentifier: WaterfallAnnotationView.ReuseID)
            case .Beaches:
                return BeachAnnotationView(annotation: annotation, reuseIdentifier: BeachAnnotationView.ReuseID)
            case .Lakes:
                return LakeAnnotationView(annotation: annotation, reuseIdentifier: LakeAnnotationView.ReuseID)
            case .Mountains:
                return MountAnnotationView(annotation: annotation, reuseIdentifier: MountAnnotationView.ReuseID)
            case .Parks:
                return ParkAnnotationView(annotation: annotation, reuseIdentifier: ParkAnnotationView.ReuseID)
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let placemark = view.annotation as? MapViewModel.LandmarkAnnotation else { return }
            
            parent.selectedPlace = placemark
            print(placemark.id)
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            guard (view.annotation as? MapViewModel.LandmarkAnnotation) != nil else { return }
            
            parent.selectedPlace = nil
            print("Annotation Deselected")
        }
        
        
    }
    


    func makeCoordinator() -> Coordinator {
        MapView.Coordinator(self)
    }
    

    func makeUIView(context: Context) -> MKMapView {
        ///  создаем карту
        let view = MKMapView()
        /// подвязываем делегат класса Coordinator
        view.delegate = context.coordinator
        ///локацию пользователя
        view.showsUserLocation = showsUserLocation
        /// центрирование региона
        view.setRegion(region, animated: true)
        /// тип карты
        view.mapType = checkingMapType
        /// возможность взаимодействия с картой
        view.isUserInteractionEnabled = userInteraction


        /// создаем набор для отображения на карте
        for landmark in landmarksForDisplay {
            let annotation = MapViewModel.LandmarkAnnotation(title: landmark.name, subtitle: nil, coordinate: landmark.coordinate, type: Landmark.Category(rawValue: landmark.category.rawValue)!, id: landmark.id)
            view.addAnnotation(annotation)
        }

        

        
        return view
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = checkingMapType
    }
    
}



/////  глушим сообщение об утечки памяти [Memory] Resetting zone allocator with 18 allocations still alive. 
//DispatchQueue.main.async {
//    /// создаем набор для отображения на карте
//    for landmark in landmarksForDisplay {
//        let annotation = MapViewModel.LandmarkAnnotation(title: landmark.name, subtitle: nil, coordinate: landmark.coordinate, type: Landmark.Category(rawValue: landmark.category.rawValue)!, id: landmark.id)
//        view.addAnnotation(annotation)
//    }
//}


//import SwiftUI
//import MapKit
//
//struct MapView: UIViewRepresentable {
//
//
//    /// ходим за аннотациями к карте
//    @EnvironmentObject var mapData: MapViewModel
//    /// откисовываем все элементы на карте которые переданы сюда /// @Binding
//    var landmarksForDisplay: [Landmark]
//    /// логика для выбранного элемента
//    @Binding var selectedPlace: MapViewModel.LandmarkAnnotation?
//    /// Главная локация,  должна дублироваться в массиве landmarksForDisplay, используется только для центрирования карты по ее координатам
//    var landmark: Landmark?
//    var showsUserLocation: Bool
//    var userInteraction: Bool
//
//    /// тип карты
//    @EnvironmentObject var mapTypes: RouteModel
//    var checkingMapType: MKMapType {
//        switch mapTypes.mapOptions {
//        case .standard:
//            return .standard
//        case .satelliteFlyover:
//            return .satelliteFlyover
//        }
//    }
//
//
//    private var region: MKCoordinateRegion {
//        if let unwrapCoordinates = landmark {
//            /// если передали Главную локацию, то центрируемся на ней
//            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: unwrapCoordinates.latitude, longitude: unwrapCoordinates.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 1.5))
//            /// если нет, то центрируемся на острове
//        } else {
//            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -8.5, longitude: 115.0701),
//                                      span: MKCoordinateSpan(latitudeDelta: 1.4, longitudeDelta: 1.3))
//        }
//    }
//
//
//
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//
//
//        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            guard let annotation = annotation as? MapViewModel.LandmarkAnnotation else { return nil }
//
//
//            switch annotation.type {
//            case .Culture:
//                return CultureAnnotationView(annotation: annotation, reuseIdentifier: CultureAnnotationView.ReuseID)
//            case .Waterfalls:
//                return WaterfallAnnotationView(annotation: annotation, reuseIdentifier: WaterfallAnnotationView.ReuseID)
//            case .Beaches:
//                return BeachAnnotationView(annotation: annotation, reuseIdentifier: BeachAnnotationView.ReuseID)
//            case .Lakes:
//                return LakeAnnotationView(annotation: annotation, reuseIdentifier: LakeAnnotationView.ReuseID)
//            case .Mountains:
//                return MountAnnotationView(annotation: annotation, reuseIdentifier: MountAnnotationView.ReuseID)
//            case .Parks:
//                return ParkAnnotationView(annotation: annotation, reuseIdentifier: ParkAnnotationView.ReuseID)
//            }
//        }
//
//        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//            guard let placemark = view.annotation as? MapViewModel.LandmarkAnnotation else { return }
//
//            parent.selectedPlace = placemark
//            print(placemark.id)
//        }
//
//        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
//            guard (view.annotation as? MapViewModel.LandmarkAnnotation) != nil else { return }
//
//            parent.selectedPlace = nil
//            print("Annotation Deselected")
//        }
//
//    }
//
//
//
//    func makeCoordinator() -> Coordinator {
//        MapView.Coordinator(self)
//    }
//
//
//    func makeUIView(context: Context) -> MKMapView {
//        ///  создаем карту
//        let view = MKMapView()
//        /// подвязываем делегат класса Coordinator
//        view.delegate = context.coordinator
//        ///локацию пользователя
//        view.showsUserLocation = showsUserLocation
//        /// центрирование региона
//        view.setRegion(region, animated: true)
//        /// тип карты
//        view.mapType = checkingMapType
//        /// возможность взаимодействия с картой
//        view.isUserInteractionEnabled = userInteraction
//
//        /// создаем набор для отображения на карте
//        for landmark in landmarksForDisplay {
//            let annotation = MapViewModel.LandmarkAnnotation(title: landmark.name, subtitle: nil, coordinate: landmark.coordinate, type: Landmark.Category(rawValue: landmark.category.rawValue)!, id: landmark.id)
//            view.addAnnotation(annotation)
//
//        }
//        return view
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        uiView.mapType = checkingMapType
//    }
//
//}
