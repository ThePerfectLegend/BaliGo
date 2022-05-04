//
//  ToolBarLikeButtons.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 22.04.2022.
//

import SwiftUI

struct LikeButtonLandmarkDetail: View {
    
    @Binding var landmark: Landmark
    
    var body: some View {
        Button {
            landmark.isLiked.toggle()
            LandmarkViewModel.instance.save(object: landmark)
            HapticManager.instance.notification(type: landmark.isLiked ? .success : .warning)
        } label: {
            LikeButtonDetailViewDesign(toggleProperty: landmark.isLiked)
        }
    }
}

struct LikeButtonActivityDetail: View {
    
    @Binding var activity: Activity
    
    var body: some View {
        Button {
            activity.isLiked.toggle()
            ActivityViewModel.instance.save(object: activity)
            HapticManager.instance.notification(type: activity.isLiked ? .success : .warning)
        } label: {
            LikeButtonDetailViewDesign(toggleProperty: activity.isLiked)
        }
    }
    
}

struct LikeButtonDetailViewDesign: View {
    
    var toggleProperty: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: toggleProperty ? "heart.fill" : "heart")
                .foregroundColor(Color.baliGo)
                .font(.footnote.weight(.bold))
            Circle().frame(width: 32, height: 32)
                .opacity(0)
        }
        .background(Blur(style: .systemMaterial))
        .mask(Circle().frame(width: 32, height: 32))
    }
}
