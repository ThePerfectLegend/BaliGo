//
//  ActivitySecondaryCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivitySecondaryCard: View {
    
    var activity: Activity
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 335, height: 160)
                    .clipped()
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    

                VStack(alignment: .leading, spacing: 2) {
                    Text(activity.name)
                        .font(.headline)
                        .lineLimit(2)
                    Text(activity.marketingText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            ActivityRaitingView(activity: activity)
                        }
                        Spacer()
                        ActivityPriceView(activity: activity)
                    }
                }
                .frame(width: 335)
            }
            .frame(width: 335)
        }
    }
}
