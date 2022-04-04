//
//  BigCardView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import SwiftUI

struct Big_Cards_View: View {

    var landmarks: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(landmarks, id: \.id) { landmark in
                        NavigationLink(destination: Landmark_Detail(landmark: landmark)) {
                            Big_Card(landmark: landmark)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 18)
            }
        }
        .padding(.vertical, 8)
    }
}

