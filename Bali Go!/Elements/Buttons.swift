//
//  Buttons.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 10.01.2022.
//

import SwiftUI

struct Back_Buttom_LandmarkDetail: View {

    var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()}) {
            ZStack {
                Text("\(Image(systemName: "chevron.backward"))")
                    .foregroundColor(Color.baliGo)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .padding()
            }
            .background(Blur(style: .systemMaterial))
            .mask(Image(systemName: "circle.fill")
            .font(.title))
        }
    }
}

struct Like_Button_LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    @Binding var engage: Landmark
    
    var body: some View {
            Button(action: {
                engage.isLiked.toggle()
                modelData.save(object: engage)
            }) {
                ZStack {
                    Text("\(Image(systemName: engage.isLiked ? "heart.fill" : "heart"))")
                        .font(.headline)
                        .foregroundColor(Color.baliGo)
                        .padding(20)
                }
                .background(Blur(style: .systemMaterial))
                .mask(Image(systemName: "circle.fill")
                .font(.title))
        }
    }
}

struct CloseButton: View {

    @Binding var showDeteil: Bool

    var body: some View {
        Button(action: {showDeteil = false}) {
            ZStack {
                Text("\(Image(systemName: "xmark"))")
                    .font(.headline)
                    .foregroundColor(Color.baliGo)
                    .padding(8)
            }
            .background(Blur(style: .systemMaterial))
            .mask(Image(systemName: "circle.fill")
            .font(.title))
        }
        .contentShape(Circle())
    }
}


// iOS15
//struct CloseButton: View {
//
//    @Binding var showDeteil: Bool
//
//    var body: some View {
//        Button(action: {showDeteil = false}) {
//            ZStack {
//                Text("\(Image(systemName: "circle.fill"))")
//                    .fontWeight(.semibold)
//                    .font(.title)
//                    .padding(20)
//                    .foregroundStyle(.regularMaterial)
//                Text("\(Image(systemName: "xmark"))")
//                    .foregroundColor(Color.baliGo)
//                    .fontWeight(.semibold)
//                    .font(.headline)
//            }
//        }
//    }
//}



// iOS 15
//struct Back_Buttom_LandmarkDetail: View {
//
//    var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        Button(action: {
//                presentationMode.wrappedValue.dismiss()
//                }) {
//        ZStack {
//            Text("\(Image(systemName: "chevron.backward"))")
//                .font(.headline)
//                .foregroundColor(Color.baliGo)
//                .padding(20)
//
//        }
//        .background(.regularMaterial)
//        .mask(Image(systemName: "circle.fill")
//        .font(.title))
//        }
//    }
//}

// iOS15
//struct Like_Button_LandmarkDetail: View {
//
//    @EnvironmentObject var modelData: ModelData
//    @Binding var engage: Landmark
//
//    var body: some View {
//            Button(action: {
//                engage.isLiked.toggle()
//                modelData.save(object: engage)
//            }) {
//                ZStack {
//                    Text("\(Image(systemName: engage.isLiked ? "heart.fill" : "heart"))")
//                        .font(.headline)
//                        .foregroundColor(engage.isLiked ? Color.baliGo : Color.baliGo)
//                        .padding(20)
//                }
////                .background(.regularMaterial)
//                .mask(Image(systemName: "circle.fill")
//                .font(.title))
//        }
//    }
//}


