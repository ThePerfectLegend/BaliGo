//
//  ActivityMainCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityMainCard: View {
    
    @State var activity: Activity
    
//    @EnvironmentObject var viewModel: ActivityViewModel
//    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
//    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(activity.image)
                    .resizable()
                    .frame(width: 335, height: 160) // 240
                    .aspectRatio(contentMode: .fit)
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))

                VStack(alignment: .leading, spacing: 2) {
                    Text(activity.name)
                        .font(.headline)
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
                }
                .frame(width: 335)
            }
            .frame(width: 335)
            
            LikeButtonActivityCard(activity: $activity)
                .font(.title)
                .padding(10)
        }
    }
}



struct ActivityRaitingView: View {
    
    var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(activity.numberOfReviews) отзывов")
                .font(.subheadline)
            HStack {
                ZStack {
                    starsView
                        .overlay(overlayView.mask(starsView))
                }
                Text(String(format: "%.1f", activity.rating))
                    .font(.subheadline)
                    .lineLimit(1)
                    .scaledToFit()
            }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(activity.rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack(spacing: 0) {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }

}


struct ActivityPriceView: View {
    
    @EnvironmentObject var vm: UserPreferencesViewModel
    var activity: Activity
    
    var price: Double = 2979
    
    //            Text("\(String(format: "%.1f", price)) ₽")
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("От")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("2 979 ₽")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.baliGo)
            Text("За человека")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
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
