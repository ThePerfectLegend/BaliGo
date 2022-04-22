//
//  All Category Items View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 30.05.2021.
//


import SwiftUI

struct All_Category_Screen: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    @State private var screenState: Bool = true
    
    var category: String

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.category.rawValue == category)
        }
    }

    var numberOfLandmarks: Int {
        filteredLandmarks.count
    }
    
    var body: some View {
        VStack {
            switch screenState {
            case true:
                ListView(likedLandmarks: filteredLandmarks, screenTitle: category)
            case false:
                MapViewInSwiftUI(landmarksForDisplay: filteredLandmarks, safeAreas: [])
            }
        }
        .navigationBarTitle(Text(category))
        .navigationBarItems(trailing: ViewSwither(list: $screenState))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
    }
    
    
    struct ViewSwither: View {
        
        @Binding var list: Bool
        
        var body: some View {
            Button(action: {
                    list.toggle()
            }) {
                if list == true {
                    Image(systemName: "map.fill")
                } else {
                    Image(systemName: "list.bullet")
                }
            }
            .padding(16)
        }
    }
    

    
    struct ListView: View {

        var likedLandmarks: [Landmark]
        var screenTitle: String

        var body: some View {
            ScrollView{
                VStack(spacing: 8) {
                    ForEach(likedLandmarks) { landmark in
                        NavigationLink(destination: Landmark_Detail(landmark: landmark)) {
                            Category_Card(landmark: landmark)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                .padding([.horizontal, .top], 18)
            }
        }
    }
}
