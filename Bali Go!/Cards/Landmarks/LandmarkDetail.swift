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
    
    private var landmarkIndex: Int {
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
                        header
                    
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod te.")
                            .font(.callout.leading(.tight))
                            .padding(.vertical, 2)
                        
                       readMoreButton
                    

                        ContentTableView(contentData: climbingToBaturVolcano.milestoneContent)
                    
                    Divider()
                    }
                    .padding(.horizontal, 12)

                    ActivityLandmarkView(landmark: landmark)
                    
                    
                    Group {
                        Text("Расположение").font(.title3.weight(.semibold))
                        NavigationLink(destination: FullMapView(landmark: landmark)) {
                        SmallMapView(landmark: landmark)
                            .frame(height: 160)
                            .frame(maxWidth: .infinity)
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        Go(coordinate: landmark.location)
                    }
                    .padding([.horizontal, .bottom], 12)
                }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: CustomBackButton(presentationMode: presentationMode),
            trailing: LikeButtonLandmarkDetail(landmark: $modelData.landmarks[landmarkIndex]))
        .sheet(isPresented: $descSheet) {
            sheedView
        }

    }
    
    private var header: some View {
        VStack(alignment: .leading) {
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
        }
    }
    
    private var readMoreButton: some View {
        Button {
            descSheet = true
        } label: {
            Text("Подробное описание").font(.callout.weight(.semibold))
        }
    }
    
    private var sheedView: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(landmark.description).font(.body)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
            }
            .navigationBarItems(
                leading: Text(landmark.name).font(.title3.weight(.semibold)),
                trailing: CloseButton(showDeteil: $descSheet))
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Blur(style: .systemMaterial))
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
