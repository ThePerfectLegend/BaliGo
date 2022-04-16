//
//  ActivityMainCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityMainCard: View {
    var body: some View {
        VStack {
            Image("agung924")
                .resizable()
                .frame(width: 335, height: 160) // 240
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Name of the Activity, very long name of this Activity")
                    .font(.headline)
                    .lineLimit(2)
                Text("Type of Activity")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Text("Value proposition or nah?")
                    .font(.subheadline)
//                Text("Option #2, more?")
//                    .font(.subheadline)
                HStack {
                    Text("RaitingView")
                    Spacer()
                    Text("PriceView")
                }
            }
            .frame(width: 335)
            
            Spacer()

        }
        .frame(width: 335)
        .padding(.horizontal)
    }
}


/*
 Image + 26%
 Name
 Type
 Short Desc?
 Teg/Tegs?
 Duration
 Price +
 Rating +
 Number of reviews
 Short add info with 1-3 options
 
 */
