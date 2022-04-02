//
//  Small Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.04.2021.
//

import SwiftUI

struct Small_Card: View {
    
    var landmark: Landmark

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
