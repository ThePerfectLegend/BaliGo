//
//  Tour Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 26.10.2021.
//

import SwiftUI

struct Tour_Card: View {
    
    var tour: Tour
    
    var body: some View {
        Button(action: {UIApplication.shared.open(URL(string: tour.link)!)} ) {
            VStack(alignment: .leading) {
                Image(tour.image)
                    .resizable()
                    .frame(width: 216, height: 144)
                    .aspectRatio(contentMode: .fit)
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                Text(tour.name)
                    .font(.callout)
                    .lineLimit(2)
            }
            .frame(width: 216)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
