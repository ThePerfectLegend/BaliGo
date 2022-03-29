//
//  Like Button.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2021.
//

import SwiftUI

struct Like_Button: View {
    
    @EnvironmentObject var modelData: ModelData
    @Binding var engage: Landmark
    
    var body: some View {
            Button(action: {
                engage.isLiked.toggle()
                modelData.save(object: engage)
            }) {
                ZStack {
                    Text("\(Image(systemName: engage.isLiked ? "heart.fill" : "heart"))")
                        .foregroundColor(engage.isLiked ? Color.baliGo : Color.white)
                }
                .mask(Image(systemName: "heart.fill"))
        }
    }
}
