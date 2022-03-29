//
//  Small Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct Small_Card: View {
    
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
                .frame(width: 160, height: 160)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.body)
                    .lineLimit(1)
            }
        }
        .frame(width: 160)
    }
}




//struct Small_Card: View {
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
//                            .font(.subheadline)
//                            .fontWeight(.semibold)
//                        Text(landmark.type)
//                            .font(.footnote)
//                        }
//                    .padding(.vertical, 4)
//                    .padding(.leading, 12.0)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(
//                        VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
//                    )
//                }
//                .frame(width: 160, height: 160)
//                .background(
//                    Image(landmark.imagesNames[0])
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                )
//                .mask(
//                    RoundedRectangle(cornerRadius: 8, style: .continuous)
//                )
//            }
//    }
//}
