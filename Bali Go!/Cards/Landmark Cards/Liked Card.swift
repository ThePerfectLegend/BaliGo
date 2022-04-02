//
//  Liked Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 21.05.2021.
//

import SwiftUI

struct Liked_Card: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var landmark: Landmark
    
    var body: some View {
        HStack(spacing: 4) {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Like_Button(engage: $modelData.landmarks[landmarkIndex])
                            .padding(8.0)
                            .font(.title2)
                    }
                    Spacer()
                }
                .frame(width: 120, height: 120)
                .background(
                    Image(landmark.imagesNames[0])
                        .resizable()
                        .aspectRatio(contentMode: .fill))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: 4) {
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(landmark.type)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Distance_View(ladnmark: landmark, showMark: true)
                    .font(.subheadline)
                Spacer(minLength: 4)
                Divider()
            }
        }
        .frame(height: 120)
        .contentShape(Rectangle())
    }
}
