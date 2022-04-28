//
//  Like Button.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2021.
//

import SwiftUI

struct LikeButtonLandmarkCard: View {
    
    @Binding var landmark: Landmark
    
    var body: some View {
        Button {
            landmark.isLiked.toggle()
            LandmarkViewModel.instance.save(object: landmark)
            HapticManager.instance.notification(type: landmark.isLiked ? .success : .warning)
        } label: {
            LikeButtonCardDesign(toggleProperty: landmark.isLiked)
        }
    }
}

struct LikeButtonActivityCard: View {
    
    @Binding var activity: Activity
    
    var body: some View {
        Button {
            activity.isLiked.toggle()
            ActivityViewModel.instance.save(object: activity)
            HapticManager.instance.notification(type: activity.isLiked ? .success : .warning)
        } label: {
            LikeButtonCardDesign(toggleProperty: activity.isLiked)
        }
    }
}


struct LikeButtonCardDesign: View {
    
    var toggleProperty: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: toggleProperty ? "heart.fill" : "heart")
                .foregroundColor(.baliGo)
        }
        .background(Blur(style: .systemUltraThinMaterial))
        .mask(Image(systemName: "heart.fill"))
    }
}
