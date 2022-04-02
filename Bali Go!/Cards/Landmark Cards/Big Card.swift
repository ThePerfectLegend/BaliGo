//
//  Big Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct Big_Card: View {
    
    var landmark: Landmark
    
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
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(width: 220)
    }
}
