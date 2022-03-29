////
////  Landmark Description Sheet.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 16.12.2021.
////
//
//import SwiftUI
//
//struct Landmark_Description_Sheet: View {
//    
//    var landmark: Landmark
//    
//    @Environment(\.dismiss) var dismiss
//    
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            ZStack {
//                HStack(alignment: .center, spacing: 8) {
//                    VStack(alignment: .leading) {
//                        Text(landmark.name)
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .lineLimit(2)
//                    }
//                        
//                    Spacer()
//                        
//                    Button{
//                        dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .font(Font.headline)
//                    }
//                    .buttonStyle(.bordered)
//                    .tint(.red)
//                    .foregroundColor(.red)
//                    .mask(Circle())
//                }
//                .padding(12)
//            }
//            .background(.ultraThinMaterial)
//            .frame(minHeight: 60)
//            
//            ScrollView(.vertical, showsIndicators: true) {
//                VStack(spacing: 12) { /// Главный стек в котором храниться отображается вся инфа
//                   
//                    /// ForEach
//                    
//                    
//                   
//                    
//                    
//                    
//
//                
//                    
//                }
//                .padding(.horizontal, 12)
//            }
//        }
//        .frame(maxWidth: .infinity)
//        .background(.regularMaterial)
//    }
//}
//
//
//struct SheedData: View {
//    
//    var header: String
//    var description: String
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            Text(header)
//                .font(.title3)
//                .fontWeight(.semibold)
//                .lineLimit(2)
//            ZStack {
//                Text(description)
//                    .padding(8)
//                }
//                .background(.ultraThickMaterial)
//                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
//        }
//    }
//}
