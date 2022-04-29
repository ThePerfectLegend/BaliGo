
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
    @State private var showLandmarkMap: Bool = false
    @State private var screenType: LikedTypes = .activity
    private var tempCS: ScreenStates {
        screenChanging()
    }
    
    private var likedLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in landmark.isLiked }
    }
    
    private var likedActivities: [Activity] {
        activityViewModel.activities.filter { activity in activity.isLiked }
    }
    
    enum LikedTypes: String, Identifiable, CaseIterable {
        case activity = "Активности"
        case landmark = "Локации"
        var id: LikedTypes { self }
    }
    
    enum ScreenStates {
        case noLikes, landmarkLiked, activityLiked, bothLiked
    }
    
    func screenChanging() -> ScreenStates {
        if (likedLandmarks.count + likedActivities.count) == 0 {
            return .noLikes
        } else if likedLandmarks.count == 0 && likedActivities.count != 0 {
            return .activityLiked
        } else if likedLandmarks.count != 0 && likedActivities.count == 0 {
            return .landmarkLiked
        } else {
            return .bothLiked
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                if tempCS == .noLikes {
                    EmptyLikesView(title: "Добавьте сюда путешествия, в которые хотите отправиться") {}
                } else {
                    switch screenType {
                    case .activity:
                        activityView
                    case .landmark:
                        landmarksView
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    addButton
                }
                ToolbarItem(placement: .principal) {
                    typePicker
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    mapSwither
                }
            }
            
        }
        .navigationViewStyle(.stack) /// глушит предупреждения в консоли об отступах
        .onAppear {
            if tempCS == .landmarkLiked {
                screenType = .landmark
            } else if tempCS == .activityLiked {
                screenType = .activity
            }
        }
    }
    
    @ViewBuilder private var typePicker: some View {
        if tempCS == .noLikes {
            Text("Избранное").font(.body.weight(.semibold))
        } else {
            Picker("LikedTypes",selection: $screenType) {
                ForEach(LikedTypes.allCases) { types in
                    Text(types.rawValue).tag(types.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 220)
        }
        
    }
    
    @ViewBuilder private var landmarksView: some View {
        if !showLandmarkMap {
            if likedLandmarks.count != 0 {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(likedLandmarks) { landmark in
                            NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                                Liked_Card(landmark: landmark) }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 18)
                    .padding(.vertical, 12)
                }
            } else {
                EmptyLikesView(title: "Добавьте сюда локации, которые хотите посетить") {}
            }
        } else {
            MapViewInSwiftUI(landmarksForDisplay: likedLandmarks, safeAreas: [])
        }
    }
    
    @ViewBuilder private var mapSwither: some View {
        if screenType == .landmark && likedLandmarks.count != 0 {
            Button {
                showLandmarkMap.toggle()
            } label: {
                if showLandmarkMap {
                    Image(systemName: "list.bullet")
                } else {
                    Image(systemName: "map.fill")
                }
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder private var activityView: some View {
        if likedActivities.count != 0 {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(likedActivities) { activity in
                        NavigationLink(destination: ActivityDetailView(activity: activity, utm_campaign: "&utm_campaign=liked")) {
                            ActivityMainCard(activity: activity)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
            }
        } else {
            EmptyLikesView(title: "Добавьте сюда активности, которыми хотите занаяться") {}
        }
    }
    
    private var addButton: some View {
        Button {
            print("Add something")
        } label: {
            Image(systemName: "plus")
        }
        
    }
    
    struct EmptyLikesView<Content:View>: View {
        
        let title: String
        let content: Content?
        
        init(title: String, @ViewBuilder content: () -> Content) {
            self.title = title
            self.content = content()
        }
        
        var body: some View {
            VStack {
                Text(title)
                content
            }
            .padding(.horizontal, 32)
            .multilineTextAlignment(.center)
        }
    }
}




