//
//  Map Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.05.2021.
//

import SwiftUI

struct Map_Screen: View {
    
    @EnvironmentObject var location: LocationFetcher
    @EnvironmentObject var modelData: LandmarkViewModel
    
    var body: some View {
        NavigationView {
            MapViewInSwiftUI(landmarksForDisplay: modelData.landmarks, safeAreas: [.top])
                .onAppear {location.authorizationToUseLocation()}
            }
        }
    }
