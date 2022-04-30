//
//  ShareButton.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 25.04.2022.
//

import SwiftUI

struct ShareButton: View {
    
    let featuredLink: String
    
    var body: some View {
        Button {
            shareButton()
        } label: {
            ZStack {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(Color.baliGo).font(.subheadline.weight(.semibold))
                Circle().frame(width: 32, height: 32)
                    .opacity(0)
            }
            .background(Blur(style: .systemMaterial))
            .mask(Circle().frame(width: 32, height: 32))
        }
    }
    
    func shareButton() {
                
        let url = URL(string: featuredLink + "&utm_content=share")
        
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}
