//
//  ActivityMainCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityMainCard: View {
    
    var activity: Activity
    
    @EnvironmentObject var viewModel: ActivityViewModel
    
    var activityIndex: Int {
        viewModel.activities.firstIndex(where: { $0.id == activity.id })!
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(activity.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: (UIScreen.main.bounds.width - 36), height: 160) // 240
                    .clipped()
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                VStack(alignment: .leading) {
                    Text(activity.name).font(.headline)
                        .lineLimit(2)
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            ActivityRaitingView(activity: activity, numberOfReviews: true)
                        }
                        Spacer()
                        ActivityPriceView(activity: activity)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 36)
            }
            .frame(width: UIScreen.main.bounds.width - 36)
            
            LikeButtonActivityCard(activity: $viewModel.activities[activityIndex])
                .font(.title)
                .padding(10)
        }
    }
}



struct ActivityRaitingView: View {
    
    var activity: Activity
    var numberOfReviews: Bool
    
    private var review: String {
        let _digit = activity.numberOfReviews % 100
            if (11...14).contains(_digit) {
                return "отзывов"
            } else {
                let digit = activity.numberOfReviews % 10
                if (2...4).contains(digit) {
                    return "отзыва"
                } else if (5...9).contains(digit) || digit == 0 {
                    return "отзывов"
                } else {
                    return "отзыв"
                }
            }
    }
    
    var body: some View {
        if numberOfReviews {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(activity.numberOfReviews) \(review)")
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
        } else {
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
                    .foregroundColor(.baliGo)
                    .frame(width: CGFloat(activity.rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack(spacing: 0) {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.callout)
                    .foregroundColor(Color.gray)
            }
        }
    }
    
}


struct ActivityPriceView: View {
    
    var activity: Activity
    
    @EnvironmentObject var userPreferencesVM: UserPreferencesViewModel
    
    private var selectedPrice: String {
        if let unwrapped = activity.price[userPreferencesVM.currency] {
            return String("\(unwrapped.formattedWithSeparator) \(userPreferencesVM.currency.rawValue)")
        } else {
            return ""
        }
    }
    
    var body: some View {
        if selectedPrice != "" {
            VStack(alignment: .trailing, spacing: 1) {
                Text("От  ").font(.subheadline)
                + Text(selectedPrice).font(.title3.weight(.semibold))
                Text(activity.priceOption).font(.subheadline)
                
            }
        } else { EmptyView() }
        
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
