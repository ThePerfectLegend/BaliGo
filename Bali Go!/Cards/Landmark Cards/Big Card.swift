//
//  Big Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct Big_Card: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(landmark.imagesNames[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 220, height: 220)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(landmark.type)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(width: 220)
    }
}




//
//struct Big_Card: View {
//
//    @EnvironmentObject var modelData: ModelData
//    var landmark: Landmark
//
//    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
//
//    var body: some View {
//        ZStack {
//                VStack {
//
//                    Spacer()
//
//                    VStack(alignment: .leading) {
//                        Text(landmark.name)
//                            .font(.headline)
//                        Text(landmark.type)
//                            .font(.footnote)
//                        }
//                        .padding(.top, 4)
//                        .padding(.bottom, 8)
//                        .padding(.leading, 20)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(
//                        VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
//                    )
//                }
//
//                .frame(width: 272, height: 272)
//                .background(
//                    Image(landmark.imagesNames[0])
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                )
//                .mask(
//                    RoundedRectangle(cornerRadius: 12, style: .continuous)
//                )
//            }
//
//    }
//}
