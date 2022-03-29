//
//  Liked Card.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 21.05.2021.
//

import SwiftUI

struct Liked_Card: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ZStack {
                VStack {
                    HStack {
                        
                        Spacer()
                        
                        Like_Button(engage: $modelData.landmarks[landmarkIndex])
                            .padding(8.0)
                            .font(.title2)
                    }
                    
                    Spacer()
    
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

struct Liked_Card_Previews: PreviewProvider {
    static var previews: some View {
        Liked_Card(landmark: landscapes[2])
            .environmentObject(ModelData())
    }
}


//HStack(alignment: .top) {
//ZStack {
//        VStack {
//            
//            HStack {
//                
//                Spacer()
//                
//                Like_Button(isLiked: $modelData.landmarks[landmarkIndex].isLiked,
//                            landmark: landmark)
//                    .padding(8.0)
//                    .font(.title)
//            }
//            
//            Spacer()
//            
//
//        }
//        .frame(width: 120, height: 120)
//        .background(
//            Image(landmark.imagesNames[0])
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//        )
//        .mask(
//            RoundedRectangle(cornerRadius: 10, style: .continuous)
//        )
//    }
//    VStack(alignment: .leading, spacing: 4) {
//        Text(landmark.name)
//            .font(.title2)
//            .fontWeight(.semibold)
//        Text(landmark.type)
//            .font(.subheadline)
//            .foregroundColor(.secondary)
//
//            Text("\(landmark.visibleAddress) (\(String(landmark.distance)) km)")
//                .font(.subheadline)
//                .fontWeight(.regular)
//
//        Divider()
//            .alignmentGuide(VerticalAlignment.bottom)
//    }
//    
//}
//.frame(height: 120)
//}
//}
