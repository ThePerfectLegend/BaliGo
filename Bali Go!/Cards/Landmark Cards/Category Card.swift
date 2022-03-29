//
//  Category Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.06.2021.
//

import SwiftUI

struct Category_Card: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ZStack {
                VStack {
                }
                .frame(width: 120, height: 120)
                .background(
                    Image(landmark.imagesNames[0])
                        .resizable()
                        .aspectRatio(contentMode: .fill))
                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(landmark.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(landmark.type)
                    .font(.subheadline)
                Distance_View(ladnmark: landmark, showMark: true)
                    .font(.subheadline)

                Spacer(minLength: 4)

                Divider()
            }
        }
        .frame(height: 120)
        .contentShape(Rectangle())
    }
}

struct Category_Card_Previews: PreviewProvider {
    static var previews: some View {
        Category_Card(landmark: landscapes[4])
            .environmentObject(ModelData())
            .environmentObject(LocationFetcher())
    }
}
