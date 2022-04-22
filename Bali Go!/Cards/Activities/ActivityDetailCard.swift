//
//  ActivityDetailCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityDetailCard: View {
    
    @State var activity: Activity = climbingToBaturVolcano
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
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
                        .font(.callout.leading(.tight))
                        .padding(.top, 2)
                    
                    ContentTableView(contentData: activity.milestoneContent)
                    BookingBotton
                    
                }
                .padding([.horizontal, .bottom,], 12)
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: CustomBackButton(presentationMode: presentationMode),
            trailing: LikeButtonActivityDetail(activity: $activity))
    }
    
    
    private var BookingBotton: some View {
            Button(action: {} ) {
                VStack(alignment: .center) {
                    Text("Заказать")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Совместно с MyBaliTrips")
                        .font(.footnote)
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color.baliGo, Color.baliGoSec]),
                                           startPoint: .init(x: 1.2, y: 0.21),
                                           endPoint: .init(x: -0.5, y: 0.79)))
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))

            }
    }
}
