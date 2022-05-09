////
////  Tours in Landmark.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 29.10.2021.
////
//
//import SwiftUI
//
//struct Tours_in_Landmark: View {
//
//    var landmark: Landmark
//
//    /// Логика отрисовки вью при наличии экскурсий на локацию
//    /// Эту логику необходимо переписать, может быть проблемный кейс когда тур не добавлен в массив tours а на локации указаны id тура
//
//    var withTours: Bool {
//        if landmark.activitiesOnLandmark.count == 0 {
//            return false
//        } else {
//            return true
//        }
//    }
//
//    /// Логика подготовки массива с турами
//
//    var toursForLandmark: [Tour] {
//        var arrayForTours = [Tour]()
//        for landmarkTourID in landmark.activitiesOnLandmark {
//            for tour in tours {
//                if landmarkTourID == tour.id {
//                    arrayForTours.append(tour)
//                }
//            }
//        }
//        return arrayForTours
//    }
//
//
//    var body: some View {
//        if withTours == true {
//            VStack(alignment: .leading) {
//                Text("Активности")
//                    .font(.title3)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal, 12)
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(alignment: .top, spacing: 12) {
//                        ForEach(toursForLandmark) { tour in
//                            Tour_Card(tour: tour)
//                        }
//                    }
//                    .padding(.horizontal, 12)
//                }
//                Divider()
//                    .padding(.horizontal, 12)
//            }
//        } else {}
//    }
//}
//
///// Логика отрисовки вью при наличии экскурсий на локацию
//
////var withTours: Bool {
////    if landmark.toursToLandmark?.count == nil {
////        return false
////    } else if landmark.toursToLandmark!.count == 0 {
////        return false
////    } else {
////        return true
////    }
////}
//
///// Логика подготовки массива с турами
//
////var toursForLandmark: [Tour] {
////    var arrayForTours = [Tour]()
////    for tour in tours {
////        if ((landmark.toursToLandmark?.firstIndex(where: {tour.id == $0})) != nil) {
////            arrayForTours.append(tour)
////        }
////    }
////    return arrayForTours
////}
