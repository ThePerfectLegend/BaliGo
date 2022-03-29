//
//  Main Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 07.05.2021.
//

import SwiftUI


struct Main_Screen: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var location: LocationFetcher
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(showsIndicators: true) {
                    Big_Cards_View(landmarks: modelData.selectedLandmarks)
                    Category_Home()
                }
            }
            .navigationBarTitle(Text("Путешествия"), displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {location.getLocation()}
    }
    
    
    
    
    struct Big_Cards_View: View {

        var landmarks: [Landmark]

        var body: some View {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(landmarks, id: \.id) { landmark in
                            NavigationLink(destination: Landmark_Detail(landmark: landmark)) {
                                Big_Card(landmark: landmark)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 18)
                }
            }
            .padding(.vertical, 8)
        }
    }
}





//        @State private var selectedOption = landscapes[0]
//        @State private var showDetail: Bool = false
//
//        static func buildView(for option: Landmark) -> some View {
//            return Landmark_Detail(landmark: option)
//        }
//
//var body: some View {
//    VStack(alignment: .leading) {
//        VStack(alignment: .leading) {
//            Divider()
//            Text("Куда отправимся?")
//                .font(.title2, weight: .semibold)
//        }
//        .padding(.horizontal, 16)
//
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 12) {
//                ForEach(landmarks, id: \.id) { landmark in
//                        Big_Card(landmark: landmark)
//                            .buttonStyle(PlainButtonStyle())
//                            .onTapGesture {
//                                selectedOption = landmark
//                                showDetail = true
//                            }
//                }
//                NavigationLink("", destination: Main_Screen.Big_Cards_View.buildView(for: selectedOption), isActive: $showDetail)
//                    .opacity(0)
//
//            }
//            .padding(.horizontal, 16)
//        }
//    }
//    .padding(.bottom, 8)
//}



//struct Main_Screen: View {
//
//    @EnvironmentObject var modelData: ModelData
//    @EnvironmentObject var location: LocationFetcher
//
//    var body: some View {
//        NavigationView {
//            ScrollView(showsIndicators: true) {
//                VStack{
//
//                    Big_Cards_View()
//                    Category_Home()
//                }
//            }
//            .navigationBarTitle("Bali Go!", displayMode: .automatic)
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .accentColor(.baliGo)
//        .onAppear { location.getLocation() }
//    }
//}
