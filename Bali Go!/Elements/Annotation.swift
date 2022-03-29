//
//  Annotation.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 17.06.2021.
//

import SwiftUI
//import SwiftUIX


struct Annotation: View {


    @Binding var isSelected: Landmark?
    var landmark: Landmark



    var body: some View {
        if isSelected != landmark {
            VStack(spacing: 0) {
                Image(systemName: "mappin.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.baliGo)
//                    .background(VisualEffectBlurView(blurStyle: .systemThinMaterial))
            }
            .mask(Circle())
            .contentShape(Circle())
            .onTapGesture {
                isSelected = landmark
                print("Selected")
            }
        } else {
            VStack(spacing: 0) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.baliGo)
//                    .background(VisualEffectBlurView(blurStyle: .systemThinMaterial))
            }
            .mask(Circle())
            .contentShape(Circle())
            .onTapGesture {
                isSelected = nil
                print("Deselected")
            }
        }
    }
}


struct Annotation_Previews: PreviewProvider {
    static var previews: some View {
        Annotation(isSelected: .constant(nil), landmark: landscapes[5])
            .environmentObject(ModelData())
    }
}


//
//struct Annotation: View {
//
//
//    @Binding var isSelected: Landmark?
//    var landmark: Landmark
//
//
//
//    var body: some View {
//        if isSelected != landmark {
//            VStack(spacing: 0) {
//                Image(systemName: "mappin.circle")
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(.baliGo)
//                    .background(VisualEffectBlurView(blurStyle: .systemThinMaterial))
//            }
//            .mask(Circle())
//            .contentShape(Circle())
//            .onTapGesture {
//                isSelected = landmark
//            }
//        } else {
//            VStack(spacing: 0) {
//                Image(systemName: "mappin.circle.fill")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.baliGo)
//                    .background(VisualEffectBlurView(blurStyle: .systemThinMaterial))
//            }
//            .mask(Circle())
//            .contentShape(Circle())
//            .onTapGesture {
//                isSelected = nil
//            }
//        }
//    }
//}
