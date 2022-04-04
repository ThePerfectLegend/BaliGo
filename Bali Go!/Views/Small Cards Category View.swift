//
//  Small Cards Category View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 17.05.2021.
//

import SwiftUI

struct Small_Cards_Category_View: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Divider()
                HStack {
                    Text(categoryName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    All_Buttom(array: items, category: categoryName)
                }
            }
            .padding(.horizontal, 18)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: Landmark_Detail(landmark: landmark)) {
                        Small_Card(landmark: landmark)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 18)
            }
        }
    }
}

