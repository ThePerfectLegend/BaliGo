//
//  ActivitySecondaryCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivitySecondaryCard: View {
    
    var activity: Activity
    var widthInfinity: Bool
    
    private var widthSize: CGFloat {
        if widthInfinity {
            return .infinity
        } else {
            return CGFloat(335)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .frame(idealWidth: widthSize, maxWidth: widthSize)
                    .clipped()
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                VStack(alignment: .leading) {
                    Text(activity.name)
                        .font(.headline)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer(minLength: 4)
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            ActivityRaitingView(activity: activity, numberOfReviews: true)
                        }
                        Spacer()
                        ActivityPriceView(activity: activity)
                    }
                }
            }
        }
        .frame(idealWidth: widthSize, maxWidth: widthSize)
    }
}
