//
//  Landmark Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct Landmark_Detail: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
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
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                            Spacer()
                            Distance_View(ladnmark: landmark, showMark: true)
                                .font(.subheadline)
                    }
                    
                        
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
                CustomBackButton(presentationMode: presentationMode)
                Spacer()
                LikeButtonLandmarkDetail(landmark: $modelData.landmarks[landmarkIndex])
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
