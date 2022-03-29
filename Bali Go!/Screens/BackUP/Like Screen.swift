
//
//  Like Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.05.2021.
// Text("Здесь отображаются места, которые хотите посетить, отметив их \(Image(systemName: "heart"))")

import SwiftUI
import SwiftUIX

struct Like_Screen: View {

    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var location: LocationFetcher

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.isLiked)
        }
    }

    @State private var screenState: Bool = true
    
    
    var numberOfLiked: Bool {
        if filteredLandmarks.count > 0 {
            return true
        } else {
            return false
        }
    }

    var body: some View {
        NavigationView {
            VStack {
            if numberOfLiked == false {
                Text("Здесь отображаются места, которые вас заинтересовали")
                    .multilineTextAlignment(.center)
                    .padding(16)
            } else {
            switch screenState {
            case true:
                ListView(likedLandmarks: filteredLandmarks)
            case false:
                MapViewInSwiftUI(landmarksForDisplay: filteredLandmarks)
                    .navigationBarHidden(false)
            }
            }
            }
            .navigationBarTitle("Избранное",
                                displayMode: .inline)
            .navigationBarItems(trailing: ViewSwither(list: $screenState, showButton: numberOfLiked))

            

        }
        
        .navigationViewStyle(StackNavigationViewStyle())
        .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterial))
//        .accentColor(.baliGo)

        
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
                                        .navigationBarHidden(true)
                        ) { Liked_Card(landmark: landmark)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                .padding(16)
            }
            
        }
    }
    
}



struct Like_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Like_Screen()
            .environmentObject(ModelData())
    }
}


//
//import SwiftUI
//import SwiftUIX
//
//struct Like_Screen: View {
//
//    @EnvironmentObject var modelData: ModelData
//
//    var filteredLandmarks: [Landmark] {
//        modelData.landmarks.filter { landmark in
//            (landmark.isLiked)
//        }
//    }
//
//    enum ScreenState: String, CaseIterable {
//        case list = "Список"
//        case map = "На карте"
//    }
//
//    @State private var screenState: ScreenState = .list
//    
//    
//    var numberOfLiked: Int {
//        filteredLandmarks.count
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//            if numberOfLiked == 0 {
//                Text("Добавьте сюда места, которые хотите посетить")
//            } else {
//            switch screenState {
//            case .list:
//                ListView(screenState: $screenState, likedLandmarks: filteredLandmarks, screenTitle: "Избранное")
//                    
//            case .map:
//                Map_View(visibleOnMap: filteredLandmarks)
//            }
//            }
//            }
//            .navigationBarTitleDisplayMode(.automatic)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    HeadlinePicker(screenState: $screenState)
//                }
//            }
//
//        }
//        .background(VisualEffectBlurView(blurStyle: .systemUltraThinMaterial))
//        .accentColor(.orange)
//        
//    }
//    
//    
//    struct HeadlinePicker: View {
//        
//        @Binding var screenState: ScreenState
//        
//        var body: some View {
//            VStack{
//            Picker("", selection: $screenState) {
//                ForEach(ScreenState.allCases, id: \.self) {
//                    Text($0.rawValue)
//                }
//            }
//            .padding(16)
//            .pickerStyle(SegmentedPickerStyle())
//                
//            }
//            .frame(width: UIScreen.main.bounds.width)
//        }
//    }
//
//
//
//    struct ListView: View {
//
//        @Binding var screenState: ScreenState
//        var likedLandmarks: [Landmark]
//        var screenTitle: String
//
//        var body: some View {
//            ScrollView{
//                VStack(spacing: 8) {
//                    Text(screenTitle)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.top, 12)
//                    Divider()
//                    ForEach(likedLandmarks) { landmark in
//                        NavigationLink(destination: Landmark_Detail(landmark: landmark)) { Liked_Card(landmark: landmark)
//                        }
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    
//                    Spacer()
//                }
//                .padding(.horizontal, 16)
//                .offset(x: 0, y: -60)
//
//                
//
//                
//
//                
//            }
//                        
//        }
//    }
//}
//
//
//struct ListView1: View {
//
////    @Binding var screenState: ScreenState
//    var likedLandmarks: [Landmark]
//    var screenTitle: String
//
//    var body: some View {
//        VStack(spacing: 8) {
//            ScrollView{
//                Text(screenTitle)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.top, 12)
//                Divider()
//                ForEach(likedLandmarks) { landmark in
//                     Liked_Card(landmark: landmark)
//                    
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//            
//
//            
//
//            Spacer()
//        }
//        .padding(.horizontal, 16)
//        .offset(x: 0, y: -60)
//        
//    }
//}
