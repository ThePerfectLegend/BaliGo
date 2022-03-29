//
//  Map Landmark Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 20.06.2021.
//

import SwiftUI

struct Map_Landmark_Detail: View {
    
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    @Binding var showDeteil: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: Landmark_Detail(landmark: landmark)
            ) {
                HStack(alignment: .top, spacing: 8) {
                    Image(landmark.imagesNames[0])
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)
                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    VStack(alignment: .leading, spacing: 4) {
                        Text(landmark.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                        Text(landmark.type)
                            .font(.subheadline)
                        Distance_View(ladnmark: landmark, showMark: true)
                            .font(.subheadline)
                    }
                            
                    Spacer()
                            
                    CloseButton(showDeteil: $showDeteil)
//                    Button{
//                        showDeteil = false
//                        print(showDeteil)
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(Font.headline)
//                    }
//                    .buttonStyle(.bordered)
//                    .tint(.baliGo)
//                    .foregroundColor(.baliGo)
//                    .mask(Circle())
                }
                .frame(height: 120)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
            
            Go(coordinate: landmark.location)
            
        }
        .padding(12)
//        .background(.ultraThinMaterial) iOS 15 only
        .background(Blur(style: .systemUltraThinMaterial))
        .mask(Custom_Corners(corners: [.topLeft, .topRight], radius: 12))
    }
}
    



/// для работы с  MapViewInSwiftUI.swift
//
//import SwiftUI
//
//struct Map_Landmark_Detail: View {
//
//    @EnvironmentObject var modelData: ModelData
//
//    var landmark: Landmark
//
//    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            HStack{
//                Spacer()
//                Capsule()
//                    .frame(width: 44, height: 4, alignment: .center)
//                    .padding(.top, 4)
////                    .foregroundColor(.secondaryLabel)
//                Spacer()
//            }
//            NavigationLink(destination: Landmark_Detail(landmark: landmark)
//            ) {
//                HStack(spacing: 8) {
//                VStack {}
//                .frame(width: 120, height: 120)
//                .background(
//                    Image(landmark.imagesNames[0])
//                        .resizable()
//                        .aspectRatio(contentMode: .fill))
//                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
//
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text(landmark.name)
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(landmark.type)
//                            .font(.subheadline)
//                        Distance_View(ladnmark: landmark, showMark: true)
//                            .font(.subheadline)
//
//                        Spacer(minLength: 4)
//
//                    }
//                    Spacer(minLength: 0)
//            }
//            .frame(height: 120)
//            .frame(maxWidth: .infinity)
//            .contentShape(Rectangle())
//            }
//            .buttonStyle(PlainButtonStyle())
//            .contentShape(Rectangle())
//
//            go(landmark: landmark)
//
//        }
//        .padding(.horizontal, 12)
//        .padding(.bottom, 16)
//        .padding(.top, 8)
//    }
//}
