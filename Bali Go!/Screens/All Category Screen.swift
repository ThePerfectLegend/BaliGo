//
//  All Category Items View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 30.05.2021.
//


import SwiftUI

struct All_Category_Screen: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var category: String

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.category.rawValue == category)
        }
    }

    @State private var screenState: Bool = true
    
    
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
                        NavigationLink(destination: Landmark_Detail(landmark: landmark)
                        ) { Category_Card(landmark: landmark)
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




struct All_Category_Items_View_Previews: PreviewProvider {
    static var previews: some View {
        All_Category_Screen(category: "Культура")
            .environmentObject(ModelData())
    }
}


//
//
//import SwiftUI
//
//struct All_Category_Items_View: View {
//
//    @EnvironmentObject var modelData: ModelData
//
//    var category: String
//
//    var filteredLandmarks: [Landmark] {
//        modelData.landmarks.filter { landmark in
//            (landmark.category.rawValue == category)
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
//    var numberOfLandmarks: Int {
//        filteredLandmarks.count
//    }
//
//
//
//    var body: some View {
//        VStack {
//            switch screenState {
//            case .list:
//                ListView(screenState: $screenState, likedLandmarks: filteredLandmarks, screenTitle: category)
//            case .map: Map_View(visibleOnMap: filteredLandmarks)
//            }
//        }
//        .navigationBarTitle(Text("Names"))
//        .navigationBarItems(trailing: HeadlinePicker(screenState: $screenState))
//
////        .toolbar {
////            ToolbarItem(placement: .principal) {
////                HeadlinePicker(screenState: $screenState)
////            }
////        }
//    }
//
////    struct ViewSwither: View {
////        <#fields#>
////    }
//
//    struct HeadlinePicker: View {
//
//        @Binding var screenState: ScreenState
////        var category: String
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
////            .frame(width: UIScreen.main.bounds.width)
//        }
//    }
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
////                    Text(screenTitle)
////                        .font(.largeTitle)
////                        .fontWeight(.bold)
////                        .frame(maxWidth: .infinity, alignment: .leading)
////                        .padding(.top, 12)
////                    Divider()
//                    ForEach(likedLandmarks) { landmark in
//                        NavigationLink(destination: Landmark_Detail(landmark: landmark)) { Liked_Card(landmark: landmark)
//                        }
//                    }
//                    .buttonStyle(PlainButtonStyle())
//
//                    Spacer()
//                }
//                .padding(.horizontal, 16)
////                .offset(x: 0, y: -60)
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
//
//
//}
