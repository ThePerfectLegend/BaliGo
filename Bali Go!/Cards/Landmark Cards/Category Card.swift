//
//  Category Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.06.2021.
//

import SwiftUI

struct Category_Card: View {
        
    var landmark: Landmark
    
    var body: some View {
        HStack(spacing: 4) {
            Image(landmark.imagesNames[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: 4) {
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(landmark.type)
                    .font(.callout)
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
