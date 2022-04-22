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
            // save
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
                .font(.headline)
                .foregroundColor(Color.baliGo)
                .padding(20)
        }
        .background(Blur(style: .systemMaterial))
        .mask(Image(systemName: "circle.fill")
        .font(.title))
    }
    
}
