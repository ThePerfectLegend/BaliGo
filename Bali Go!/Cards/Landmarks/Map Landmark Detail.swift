//
//  Map Landmark Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 20.06.2021.
//

import SwiftUI

struct Map_Landmark_Detail: View {
    
    @Binding var showDeteil: Bool
    
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: LandmarkDetailView(landmark: landmark)) {
                HStack(alignment: .top, spacing: 8) {
                    Image(landmark.imagesNames[0])
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fill)
                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    VStack(alignment: .leading, spacing: 4) {
                        Text(landmark.name).font(.headline)
                            .lineLimit(2)
                        Text(landmark.type).font(.callout.weight(.medium))
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                        Distance_View(ladnmark: landmark, showMark: true)
                            .font(.subheadline)
                    }
                    Spacer()
                    CloseButton(showDeteil: $showDeteil)
                        .padding(8)

                }
                .frame(height: 120)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
            Go(coordinate: landmark.location)
        }
        .padding(12)
        .background(Blur(style: .systemThinMaterial))
        .mask(Custom_Corners(corners: [.topLeft, .topRight], radius: 8))
    }
}
