//
//  Map Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.05.2021.
//

import MapKit
import SwiftUI

struct Map_Screen: View {
    
//    init() {
//    let appearance = UITabBarAppearance()
//    appearance.configureWithOpaqueBackground()
//    }
    
    @EnvironmentObject var location: LocationFetcher
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            MapViewInSwiftUI(landmarksForDisplay: modelData.landmarks, safeAreas: [.top])
                .onAppear {location.start()}
            }
        }
    }






//import MapKit
//import SwiftUI
//
//struct Map_Screen: View {
//
//    @EnvironmentObject var location: LocationFetcher
//    @EnvironmentObject var modelData: ModelData
//
//    var body: some View {
//        NavigationView {
//            Map_View(visibleOnMap: modelData.landmarks)
//                .onAppear {
//                    location.start()
//                }
//            }
//        }
//    }
//
//    struct Map_Screen_Previews: PreviewProvider {
//        static var previews: some View {
//            Map_Screen()
//        }
//    }
