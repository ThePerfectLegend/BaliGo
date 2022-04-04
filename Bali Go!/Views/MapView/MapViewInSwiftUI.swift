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
                    Map_Landmark_Detail(showDeteil: $showDeteil, landmark: isSelected!) }
            
            }
                
        }
        .onChange(of: selectedPlace, perform: { value in findLandmark() })
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(safeAreas)

    }
}
