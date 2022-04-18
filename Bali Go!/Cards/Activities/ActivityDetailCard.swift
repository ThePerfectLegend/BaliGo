//
//  ActivityDetailCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityDetailCard: View {
    
    let activity: Activity = climbingToBaturVolcano
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { reader -> AnyView in
                        let offset = reader.frame(in: .global).minY
                        return AnyView(
                            Image(activity.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 1.5 + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: UIScreen.main.bounds.width / 1.5)
                }
                VStack(alignment: .leading) {
                    Text(activity.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(activity.type)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                            ActivityRaitingView(activity: activity)
                        }
                        Spacer()
                        ActivityPriceView(activity: activity)
                    }
                    
                    Text(activity.description)
                        .font(.callout)
                        .padding(.top, 2)
                    
                    Text("Полное описание на MyBaliTrips \(Image(systemName: "arrow.up.forward.app.fill"))")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.baliGo)
                        .padding(.top, 2)
                    
                }
                .padding(.horizontal, 12)
                
                _tempList()
                    .offset(y: -28)
                    .padding(.trailing, 12)


            }
        }
    }
}
