
//
//  Like Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.05.2021.
// Text("Здесь отображаются места, которые хотите посетить, отметив их \(Image(systemName: "heart"))")

import SwiftUI

struct Like_Screen: View {

    @EnvironmentObject var modelData: LandmarkViewModel
    @EnvironmentObject var activityViewModel: ActivityViewModel
    @State private var screenState: Bool = true
    @State private var selection: String = "Activity"

    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in landmark.isLiked }
    }
    
    private var likedActivities: [Activity] {
        activityViewModel.activities.filter { activity in activity.isLiked }
    }
    
    @State var screenType: LikedTypes = .activity
    
    enum LikedTypes: String, Identifiable, CaseIterable {
        case activity = "Активности"
        case landmark = "Локации"
        var id: LikedTypes { self }
    }
    
    // Сценарии
    // Нет лайкнутых элементов - пустой экран
    // Есть лайкнутые локации
    // Есть лайкнутые активности
    // Есть и активности и локации
    
    
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
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(false)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ViewSwither(list: $screenState, showButton: numberOfLiked)
                    }
                    ToolbarItem(placement: .principal) {
                        typePicker
                    }
                }

        }
        .navigationViewStyle(.stack) /// глушит предупреждения в консоли об отступах
    }
    
    private var typePicker: some View {
        Picker("LikedTypes",selection: $screenType) {
            ForEach(LikedTypes.allCases) { types in
                Text(types.rawValue).tag(types.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 220)
    }
    
    private var addButton: some View {
        Button {
            print("Add something")
        } label: {
            Image(systemName: "plus")
        }

    }
    

    struct TextIfEmpty: View {
        var body: some View {
            VStack {
                Text("Здесь сохраняются места и активности, которые вы отметите ")
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
//            .padding(16)
            } else {
                EmptyView()
            }
        }
        
    }

    struct ListView: View {

        var likedLandmarks: [Landmark]

        var body: some View {
            ScrollView{
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(likedLandmarks) { landmark in
                        NavigationLink(destination: LandmarkDetailView(landmark: landmark)
                        ) { Liked_Card(landmark: landmark) }
                    }
                    .buttonStyle(PlainButtonStyle())

                    Spacer()
                }
                .padding(18)
            }
        }
    }
}
