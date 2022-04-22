
//
//  Like Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.05.2021.
// Text("Здесь отображаются места, которые хотите посетить, отметив их \(Image(systemName: "heart"))")

import SwiftUI

struct Like_Screen: View {

    @EnvironmentObject var modelData: LandmarkViewModel
    @State private var screenState: Bool = true

    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in (landmark.isLiked) }
    }
    
    private var numberOfLiked: Bool {
        if filteredLandmarks.count != 0 {
            return true
        } else {
            return false
        }
    }
    

    var body: some View {
        NavigationView {
                VStack {
                    if numberOfLiked == false {
                        TextIfEmpty()
                        } else {
                            switch screenState {
                            case true:
                                ListView(likedLandmarks: filteredLandmarks)
                            case false:
                                MapViewInSwiftUI(landmarksForDisplay: filteredLandmarks, safeAreas: [])
                            }
                        }
                }
                .navigationBarTitle(Text("Избранное"), displayMode: .inline)
                .navigationBarItems(trailing: ViewSwither(list: $screenState, showButton: numberOfLiked))
                .navigationBarHidden(false)
        }
        .navigationViewStyle(.stack) /// глушит предупреждения в консоли об отступах
    }
    

    struct TextIfEmpty: View {
        var body: some View {
            VStack {
                Text("Здесь сохраняются места, которые вы отметите ")
                + Text("\(Image(systemName: "heart.fill"))")
                    .foregroundColor(.baliGo)
            }
            .padding(.horizontal, 32)
            .multilineTextAlignment(.center)
            
        }
    }
    
    
    struct ViewSwither: View {
        
        @Binding var list: Bool
        var showButton: Bool
        
        var body: some View {
            if showButton == true {
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
            } else {
                EmptyView()
            }
        }
        
    }

    struct ListView: View {

        var likedLandmarks: [Landmark]

        var body: some View {
            ScrollView{
                VStack(spacing: 8) {
                    ForEach(likedLandmarks) { landmark in
                        NavigationLink(destination: Landmark_Detail(landmark: landmark)
                        ) { Liked_Card(landmark: landmark) }
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
                .padding([.horizontal, .top], 18)
            }
        }
    }
}
