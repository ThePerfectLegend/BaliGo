//
//  Main Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 07.05.2021.
//

import SwiftUI


struct Main_Screen: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    @EnvironmentObject var location: LocationFetcher
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(showsIndicators: true) {
                    NavigationLink(destination: ActivityDetailCard()) {
                        ActivityMainCard(activity: climbingToBaturVolcano)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Category_Home()
                }
            }
            .navigationBarTitle(Text("Путешествия"), displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {location.fetchingLocation()}
    }
}
