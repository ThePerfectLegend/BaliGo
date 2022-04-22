//
//  LD.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 29.11.2021.
//

import SwiftUI

struct LD: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
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
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: UIScreen.main.bounds.width)
                }
                VStack(alignment: .leading) {
                    Group {
                        Text(landmark.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text(landmark.type)
                            Spacer()
                            Distance_View(ladnmark: landmark, showMark: true)
                    }
                    .font(.subheadline)
                        
                    ExpandableText(landmark.discription, lineLimit: 4)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    Divider()
                        
                        }
                        .padding(.horizontal, 12)
                    
                    Tours_in_Landmark(landmark: landmark)
                    
                    Group {
                        Text("Расположение")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(landmark.visibleAddress)
                            .font(.subheadline)
                        NavigationLink(destination: FullMapView(landmark: landmark)) {
                        SmallMapView(landmark: landmark)
                            .frame(height: 144)
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        Go(coordinate: landmark.location)
                    }
                    .padding([.horizontal], 12)
                }
                    
                

            
        }
            HStack{
                CustomBackButton(presentationMode: presentationMode)
                Spacer()
                LikeButtonLandmarkDetail(landmark: $modelData.landmarks[landmarkIndex])
            }
            .padding(.horizontal, 12)
        }
        .padding(.bottom, 12)
        .navigationBarHidden(true)

    }
}
    
    
    
//    struct TempCardView: View {
//
//        var body: some View {
//            HStack {
//                Text("Landmark name")
//                Image("temp")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 150, height: 150)
//            }
//        }
//    }
    
    
//    struct TempHeaderView: View {
//
//        @StateObject var landmarkData = LandmarkViewModel()
//
//        var body: some View {
//            VStack(alignment: .leading){
//                Text("Landmark Name")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                Text("Landmark Type")
//                    .font(.subheadline)
//                if landmarkData.offset > UIScreen.main.bounds.width {
//                    Divider()
//                }
//            }
//            .padding(.horizontal)
//            .frame(height: 60)
//            .frame(maxWidth: .infinity, alignment: .leading)
////            .background(Color.white)
//        }
//    }
//}

//
//import SwiftUI
//
//struct LD: View {
//
//    @StateObject var landmarkData = LandmarkViewModel()
//
//
//    var body: some View {
//        ScrollView{
//            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders]){
//
//                GeometryReader { reader -> AnyView in
//
//                    let offset = reader.frame(in: .global).minY
//
//                    if -offset >= 0 {
//                        DispatchQueue.main.async {
//                            self.landmarkData.offset = offset
//                        }
//                    }
//
//                    return AnyView(
//                        Image("temp")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width + (offset > 0 ? offset : 0))
//                            .cornerRadius(2)
//                            .offset(y: (offset > 0 ? -offset : 0))
//                    )
//                }
//                .frame(height: UIScreen.main.bounds.width)
//
//                Section(header: TempHeaderView()) {
//                    TempCardView()
//                    TempCardView()
//                    TempCardView()
//                }
//            }
//        }
//        .overlay(
//            Color.white
//                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
//                .ignoresSafeArea(.all, edges: .top)
//                .opacity(landmarkData.offset > UIScreen.main.bounds.width ? 1 : 0)
//            , alignment: .top
//        )
//        .environmentObject(landmarkData)
//    }
//
//
//
//    struct TempCardView: View {
//
//        var body: some View {
//            HStack {
//                Text("Landmark name")
//                Image("temp")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 150, height: 150)
//            }
//        }
//    }
//
//
//    struct TempHeaderView: View {
//
//        @StateObject var landmarkData = LandmarkViewModel()
//
//        var body: some View {
//            VStack(alignment: .leading){
//                Text("Landmark Name")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                Text("Landmark Type")
//                    .font(.subheadline)
//                if landmarkData.offset > UIScreen.main.bounds.width {
//                    Divider()
//                }
//            }
//            .padding(.horizontal)
//            .frame(height: 60)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.white)
//        }
//    }
//}
