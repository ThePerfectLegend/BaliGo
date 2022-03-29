//
//  MapViewInSwiftUI.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 11.08.2021.


import SwiftUI
import CoreLocation

struct MapViewInSwiftUI: View {
    
    @StateObject var mapData = MapViewModel()
    @State private var selectedPlace: MapViewModel.LandmarkAnnotation?
    @State private var isSelected: Landmark?
    @State private var showDeteil: Bool = false
    
    /// ходим за инфо о возможности отображения пользователя на карте
    @EnvironmentObject var showUserLocation: LocationFetcher
    
    var landmarksForDisplay: [Landmark] /// @State
    var safeAreas: Edge.Set
    
/// кажется здесь должна быть логика на деселект локации
    func findLandmark() {
        if selectedPlace != nil {
            let landmarkAnotationId = selectedPlace!.id
            let landmark = landmarksForDisplay.first(where: {$0.id == landmarkAnotationId})
            isSelected = landmark
            showDeteil = true
            print(isSelected?.name as Any)
            print(showDeteil)
        } else {
            isSelected = nil
            showDeteil = false
            
            print(isSelected?.name as Any)
        }
    }
    
    
    var body: some View {
        ZStack {
            MapView(landmarksForDisplay: landmarksForDisplay, selectedPlace: $selectedPlace, showsUserLocation: showUserLocation.showUserLocation, userInteraction: true)
                .environmentObject(mapData)
            VStack{
                Spacer()
                if showDeteil == true {
                    Map_Landmark_Detail(landmark: isSelected!, showDeteil: $showDeteil) }
            
            }
                
        }
        .onChange(of: selectedPlace, perform: { value in findLandmark() })
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(safeAreas)

    }
}


/// эта часть кода работает с закоменченым куском из Map Landmark Detail.swift
//import SwiftUI
//import CoreLocation
//
//struct MapViewInSwiftUI: View {
//
//    @StateObject var mapData = MapViewModel()
//    @State private var selectedPlace: MapViewModel.LandmarkAnnotation?
//    @State private var isSelected: Landmark?
//    @State var offset: CGFloat = 0 /// для анимации и переходов всплывающего окна
//    /// ходим за инфо о возможности отображения пользователя на карте
//    @EnvironmentObject var showUserLocation: LocationFetcher
//
//    var landmarksForDisplay: [Landmark] /// @State
//    var safeAreas: Edge.Set
//
//
//    func findLandmark() {
//        if selectedPlace != nil {
//            let landmarkAnotationId = selectedPlace!.id
//            let landmark = landmarksForDisplay.first(where: {$0.id == landmarkAnotationId})
//            isSelected = landmark
//            print(isSelected?.name as Any)
//        } else {
//            isSelected = nil
//            print(isSelected?.name as Any)
//        }
//    }
//
//
//    var body: some View {
//        ZStack {
//            MapView(landmarksForDisplay: landmarksForDisplay, selectedPlace: $selectedPlace, showsUserLocation: showUserLocation.showUserLocation, userInteraction: true)
//                .environmentObject(mapData)
//
//
//
//
//
//
//        /// пилим отсюда(тут происходит магия....)
//        if isSelected != nil {
//            VStack {
//                GeometryReader { geo  in
//                    Map_Landmark_Detail(landmark: isSelected!)
//                        .background(.ultraThinMaterial)
//                        .mask(Custom_Corners(corners: [.topLeft, .topRight], radius: 12))
//                        .offset(y: (isSelected != nil) ? geo.frame(in: .global).height - 212 : geo.frame(in: .global).height)
//                        .offset(y: offset)
//
//            .gesture(DragGesture()
//                .onChanged({ (value) in  /// начало жеста и изменение положения окна
//                        withAnimation{
//                            if value.startLocation.y > geo.frame(in: .global).midX {
//                                if value.translation.height > 0 && offset < geo.frame(in: .global).height - 212 {
//                                    offset = value.translation.height
//                                }
//                            }
//                        }
//                    })
//                .onEnded({ (value) in /// окончание жеста
//                        withAnimation{ /// верхний порог подъема окна
//                            if value.startLocation.y > geo.frame(in: .global).midX {
//                                if -value.translation.height > geo.frame(in: .global).minX {
//                                    offset = 0
//                                    return
//                                }
//                                /// опускает окно вниз
//                                offset = geo.frame(in: .global).height
//                                isSelected = nil
//                                selectedPlace = nil
//                                offset = 0
//                            }
//                        }
//                    })
//            )
//        }
//        }
//        }
//
//        }
//        .onChange(of: selectedPlace, perform: { value in findLandmark() })
//        .navigationBarHidden(true)
//        .edgesIgnoringSafeArea(safeAreas)
//
//    }
//}
