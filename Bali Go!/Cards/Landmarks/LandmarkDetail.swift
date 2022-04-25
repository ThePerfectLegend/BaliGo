//
//  Landmark Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    @State private var descSheet = false
    
    @EnvironmentObject var viewModel: ActivityViewModel
    
        
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
                                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.width * 0.5) + (offset > 0 ? offset : 0))
                                .clipped()
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: UIScreen.main.bounds.width * 0.5)
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
                    
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te.")
                            .font(.subheadline)
                            .padding(.vertical, 2)
                        
                        Button {
                            descSheet = true
                        } label: {
                            Text("Подробное описание")
                                .font(.callout.weight(.semibold))
                        }
                    }

                        ContentTableView(contentData: climbingToBaturVolcano.milestoneContent)
                    
                    Divider()
                        .padding(.bottom, 8)
                        

                    
                    ActivitySecondaryCard(activity: climbingToBaturVolcano)
                    
                    Group {
                        Divider()
                            .padding(.bottom, 8)
                        NavigationLink(destination: FullMapView(landmark: landmark)) {
                        SmallMapView(landmark: landmark)
                            .frame(height: 160)
                            .frame(maxWidth: .infinity)
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        Go(coordinate: landmark.location)
                    }
                }
                .padding([.horizontal, .bottom], 12)
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: CustomBackButton(presentationMode: presentationMode),
            trailing: LikeButtonLandmarkDetail(landmark: $modelData.landmarks[landmarkIndex]))
        .sheet(isPresented: $descSheet) {
//            descSheet = false
        } content: {
            SheedView(landmark: landmark)
        }

//        .sheet(isPresented: $descSheet, content: SheedView(landmark: landmark))
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

struct SheedView: View {
    
    var landmark: Landmark
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text(landmark.description)
                        .font(.body)
                }
                .padding(.horizontal, 12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clearModalBackground()
        .background(Blur(style: .systemMaterial))
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle(landmark.name)
//        .toolbar {
//            ToolbarItem(placement: .automatic) {
//                VStack {
//                    Text(landmark.name)
//                        .font(.headline)
//                    Text(landmark.type)
//                        .font(.subheadline)
//                }
//            }
//        }
    }
}
