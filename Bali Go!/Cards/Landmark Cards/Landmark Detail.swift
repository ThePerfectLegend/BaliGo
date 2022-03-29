//
//  Landmark Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI
import MapKit


struct Landmark_Detail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var descSheet = false
    
        
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView{
                VStack{
                    GeometryReader { reader -> AnyView in
                        let offset = reader.frame(in: .global).minY
                        return AnyView(
                            Image(landmark.imagesNames[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: UIScreen.main.bounds.width)
                }
                VStack(alignment: .leading) {
                    Group {
                        Text(landmark.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text(landmark.type)
                            Spacer()
                            Distance_View(ladnmark: landmark, showMark: true)
                    }
                    .font(.subheadline)
                        
                    ExpandableText(landmark.discription, lineLimit: 4)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    Divider()
                        
                        }
                        .padding(.horizontal, 12)
                    
                    Tours_in_Landmark(landmark: landmark)
                    
                    Group {
                        Text("Расположение")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(landmark.visibleAddress)
                            .font(.subheadline)
                        NavigationLink(destination: FullMapView(landmark: landmark)) {
                        SmallMapView(landmark: landmark)
                            .frame(height: 144)
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        Go(coordinate: landmark.location)
                            .padding(.bottom, 12)
                    }
                    .padding([.horizontal], 12)
                }
        }
            HStack{
                Back_Buttom_LandmarkDetail(presentationMode: presentationMode)
                Spacer()
                Like_Button_LandmarkDetail(engage: $modelData.landmarks[landmarkIndex])
            }
            .padding(.horizontal, 12)
        }
        .navigationBarHidden(true)
        

    }

}


struct SmallMapView: View {
    
    ///Наследие, полноценно не используется, только для инициализации карты
    @State private var selectedPlace: MapViewModel.LandmarkAnnotation?
    ///Забираем часть настроек карты
    @StateObject var mapData = MapViewModel()
    var landmark: Landmark
    
    var body: some View {
        MapView(landmarksForDisplay: [landmark], selectedPlace: $selectedPlace, landmark: landmark, showsUserLocation: false, userInteraction: false)
            .environmentObject(mapData)
    }
}

struct FullMapView: View {
    
    ///Наследие, полноценно не используется, только для инициализации карты
    @State private var selectedPlace: MapViewModel.LandmarkAnnotation?
    ///Забираем часть настроек карты
    @StateObject var mapData = MapViewModel()
    /// ходим за инфо о возможности отображения пользователя на карте
    @EnvironmentObject var showUserLocation: LocationFetcher
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(landmarksForDisplay: [landmark], selectedPlace: $selectedPlace, landmark: landmark, showsUserLocation: showUserLocation.showUserLocation, userInteraction: true)
                .environmentObject(mapData)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(landmark.name)
    }
}

///Назад по свайпу
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}







//import SwiftUI
//import MapKit
//
//
//struct Landmark_Detail: View {
//
//    @EnvironmentObject var modelData: ModelData
//    var landmark: Landmark
//
//    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
//
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
//
//    var body: some View {
//
//        ZStack {
//            GeometryReader { geo in
//            ScrollView {
//                ZStack(alignment: .bottom)  {
//
//                TabView {
//                    ForEach(1..<landmark.imagesScroll.count) { index in
//                        Image(landmark.imagesNames[index])
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
//
//
//                }
//                .frame(width: geo.size.width, height: geo.size.width * 1.333333333333333)
//                .edgesIgnoringSafeArea(.top)
//
//                VStack(alignment: .leading) {
//                    Group {
//                            Text(landmark.name)
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                    HStack {
//                        Text(landmark.type)
//                        Spacer()
//                        Distance_View(ladnmark: landmark, showMark: true)
//
//                    }
//                    .font(.subheadline)
//                        ExpandableText(landmark.discription, lineLimit: 4)
//                            .fixedSize(horizontal: false, vertical: true)
//
//                        Divider()
//                    }
//                    .padding([.horizontal], 12)
//
//
//
//
//
//
//
//                    Tours_in_Landmark(landmark: landmark)
//
//                    Group {
//                        Text("Расположение")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(landmark.visibleAddress)
//                            .font(.subheadline)
//                        NavigationLink(destination: FullMapView(landmark: landmark)) {
//                        SmallMapView(landmark: landmark)
//                            .frame(height: 144)
//                            .mask(
//                                RoundedRectangle(cornerRadius: 8, style: .continuous))
//
//                        }
//                        go(landmark: landmark)
//                    }
//                    .padding([.horizontal], 12)
//
//
//
//
//
//                }
//
//
//                .padding(.bottom, 16)
//
//
//            }
//            .edgesIgnoringSafeArea(.top)
//
//                HStack{
//                    Back_Buttom_LandmarkDetail(presentationMode: presentationMode, colorScheme: colorScheme)
//                    Spacer()
//                    Like_Button_LandmarkDetail(isLiked: $modelData.landmarks[landmarkIndex].isLiked, landmark: landmark, colorScheme: colorScheme)
//                }
//                .padding(.horizontal, 16)
//
//            } /// del
//        }
//        .navigationBarHidden(true)
//        .accentColor(Color.white)
//    }
//    }




//struct go: View {
//
//    @EnvironmentObject var location: LocationFetcher
//    @EnvironmentObject var route: RouteModel
//    private var mapOptionForApple: String {
//        switch route.mapOptions {
//        case .standard:
//            return "m"
//        case .satelliteFlyover:
//            return "k"
//        }
//    }
//
//    var landmark: Landmark
//
//    var link: String {
//        switch route.routeApp {
//        case .googleMaps:
//            if location.locationForDistance != nil {
//                return "https://www.google.com/maps/dir/?api=1&origin=\(location.lastKnownLocation!.latitude),\(location.lastKnownLocation!.longitude))&destination=\(landmark.latitude),\(landmark.longitude)"
//            } else {
//                return "https://www.google.com/maps/dir/?api=1&destination=\(landmark.latitude),\(landmark.longitude)"
//            }
//        case .appleMaps:
//            if location.locationForDistance != nil {
//                return "http://maps.apple.com/?saddr=\(location.lastKnownLocation!.latitude),\(location.lastKnownLocation!.longitude)&daddr=\(landmark.latitude),\(landmark.longitude)&t=\(mapOptionForApple)"
//            } else {
//           return "http://maps.apple.com/?daddr=\(landmark.latitude),\(landmark.longitude)&t=\(mapOptionForApple)"
//            }
//        }
//    }
//
//
//    var body: some View {
//        Button(action: {UIApplication.shared.open(URL(string: link)!)} ) {
//            Text("Поехали!")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .foregroundColor(Color.white)
//                .frame(maxWidth: .infinity)
//                .frame(height: 44)
//                .background(LinearGradient(gradient: Gradient(colors: [Color.baliGo, Color.baliGoSec]),
//                                           startPoint: .init(x: 1.2, y: 0.21),
//                                           endPoint: .init(x: -0.5, y: 0.79)))
//                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
//
//        }
//    }
//}





//extension UINavigationController {
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        interactivePopGestureRecognizer?.delegate = nil
//    }
//}


//struct Landmark_Detail: View {
//
//    @EnvironmentObject var modelData: ModelData
//    var landmark: Landmark
//
//    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
//
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
//
//    var body: some View {
//        ZStack {
//            GeometryReader { geo in
//            ScrollView {
//                ZStack(alignment: .bottom)  {
//
//                TabView {
//                    ForEach(0..<landmark.imagesScroll.count) { index in
//                        Image(landmark.imagesNames[index])
//                            .resizable()
//
//
//
//                            .aspectRatio(contentMode: .fill)
//
//
//                    }
//
//                }
//
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
//
//
//                }
//                .frame(width: geo.size.width,
//                       height: ((geo.size.width) / 3) * 4)
//                .edgesIgnoringSafeArea(.top)
//
//                VStack(alignment: .leading) {
//                            Text(landmark.name)
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                    HStack {
//                        Text(landmark.type)
//                        Spacer()
//                        Image(systemName: "location.fill")
//                        Text("\(String(landmark.distance)) km")
//                    }
//                    .font(.subheadline)
//
//                    Divider()
//
//                    Text(landmark.discription)
//
//
//                }
//
//                .padding([.horizontal], 12)
//                .padding(.bottom, 100)
//                .fixedSize(horizontal: false, vertical: true)
//
//            }
//            .edgesIgnoringSafeArea(.top)
//
//
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.large)
//        .navigationBarItems(
//            leading: Back_Buttom_LandmarkDetail(presentationMode: presentationMode, colorScheme: colorScheme),
//            trailing: Like_Button_LandmarkDetail(isLiked: $modelData.landmarks[landmarkIndex].isLiked, landmark: landmark, colorScheme: colorScheme)
//        )
//    }
//    }
//
//

//
//
//struct Like_Button_LandmarkDetail: View {
//
//    @EnvironmentObject var modelData: ModelData
//    @Binding var isLiked: Bool
//    var landmark: Landmark
//    var colorScheme: ColorScheme
//
//    var body: some View {
//        HStack(spacing: 16) {
//            Image(systemName: "square.and.arrow.up")
//                .foregroundColor(.white)
//            Button(action: {
//                isLiked.toggle()
//                modelData.save()
//            }) {
//                ZStack {
//                    Image(systemName: isLiked ? "heart.fill" : "heart")
//                        .foregroundColor(isLiked ? Color.baliGo : Color.white)
//                }
//                .background(colorScheme == .light ?
//                    (VisualEffectBlurView(blurStyle: .systemUltraThinMaterialDark)) : (VisualEffectBlurView(blurStyle: .systemUltraThinMaterialLight))
//                                )
//                .mask(Image(systemName: "heart.fill"))
//
//        }
//        }
//        .padding(16)
//        .font(.title)
//    }
//}
//
//
//

//struct DetailMap: View {
//
//    var landmark: Landmark
//
//    @State private var region = MKCoordinateRegion()
//
//    func setRegion(forCenter: Landmark) {
//        region = MKCoordinateRegion(
//            center: forCenter.coordinate,
//            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 1.5)
//        )
//        print("Map Drowed")
//    }
//
//    var body: some View {
//        VStack {
//            Map(coordinateRegion: $region, annotationItems: [landmark]) {item in
//                MapMarker(coordinate: item.coordinate, tint: .baliGo)
//                        }
//            .onAppear{setRegion(forCenter: landmark)}
//        }
//    }
//}


//struct DetailMap: View {
//
//    var landmark: Landmark
//
//    @State private var region = MKCoordinateRegion()
//
//    func setRegion(forCenter: Landmark) {
//        region = MKCoordinateRegion(
//            center: forCenter.coordinate,
//            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 1.5)
//        )
//    }
//
//
//    var body: some View {
//        VStack {
//            Map(coordinateRegion: $region, interactionModes: MapInteractionModes(), showsUserLocation: false, userTrackingMode: nil, annotationItems: [landmark]) {item in
//                MapMarker(coordinate: item.coordinate, tint: .baliGo)
//                        }
//            .onAppear{setRegion(forCenter: landmark)}
//        }
//    }
//}
