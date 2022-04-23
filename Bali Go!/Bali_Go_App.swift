//
//  Bali_Go_App.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 03.04.2021.
//

import SwiftUI

@main
struct Bali_Go_App: App {
    
    
    
    @StateObject private var modelData = LandmarkViewModel()
    @StateObject private var location = LocationFetcher()
    @StateObject private var route = UserPreferencesViewModel()
    @StateObject private var activityViewModel = ActivityViewModel()
//    @StateObject private var eventModel = EventModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(location)
                .environmentObject(route)
                .environmentObject(activityViewModel)
//                .environmentObject(eventModel)

        }
    }
}
