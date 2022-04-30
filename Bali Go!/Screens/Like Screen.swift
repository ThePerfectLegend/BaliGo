
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
//    @State private var showSuggestSheet: Bool = false
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
                switch tempCS {
                case .noLikes:
                    TextIfEmpty()
                case .landmarkLiked:
                    landmarksView.onAppear {screenType = .landmark}
                case .activityLiked:
                    activityView.onAppear {screenType = .activity}
                case .bothLiked:
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
        if tempCS == .bothLiked {
            Picker("LikedTypes",selection: $screenType) {
                ForEach(LikedTypes.allCases) { types in
                    Text(types.rawValue).tag(types.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 220)
        } else {
            Text("Избранное").font(.body.weight(.semibold))
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
                    Image(systemName: "list.bullet").font(.subheadline.weight(.semibold))
                } else {
                    Image(systemName: "map.fill").font(.subheadline.weight(.semibold))
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
    
    struct TextIfEmpty: View {
        var body: some View {
            VStack {
                Text("Здесь хранятся места и активности, отмеченные ")
                + Text("\(Image(systemName: "heart.fill"))")
                    .foregroundColor(.baliGo)
            }
            .padding(.horizontal, 32)
            .multilineTextAlignment(.center)
            
        }
    }
    
    
//    private var addButton: some View {
//        Button {
//            showSuggestSheet.toggle()
//        } label: {
//            Image(systemName: "plus")
//        }
//    }
    
//    struct SuggestionSheet: View {
//
//        var suggestionScenario: LikedTypes
//        @Binding var showSheed: Bool
//        private var suggestedActivity: [Activity] {
//            ActivityViewModel.instance.getSuggestion()
//        }
//        private var suggestedLandmark: [Landmark] {
//            LandmarkViewModel.instance.getSuggestion()
//        }
//
//
//
//        var body: some View {
//            NavigationView {
//                ScrollView {
//                    VStack {
//                        switch suggestionScenario {
//                        case .activity:
//                            VStack(alignment: .leading, spacing: 12) {
//                                ForEach(suggestedActivity) { activity in
//                                    NavigationLink(destination: ActivityDetailView(activity: activity, utm_campaign: "&utm_campaign=suggest")) {
//                                        ActivityMainCard(activity: activity)
//                                    }
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                            }
//                        case .landmark:
//                            VStack(alignment: .leading, spacing: 8) {
//                                ForEach(suggestedLandmark) { landmark in
//                                    NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
//                                        Liked_Card(landmark: landmark) }
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                            }
//                        }                    }
//                    .padding([.horizontal, .bottom], 18)
//                    .padding(.top, 8)
//                }
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        Text(suggestionScenario.rawValue).font(.body.weight(.semibold))
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        CloseButton(showDeteil: $showSheed)
//                    }
//                }
//            }
//            .background(Blur(style: .systemMaterial))
//        }
//    }

}




