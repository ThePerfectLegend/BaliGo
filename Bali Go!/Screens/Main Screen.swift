//
//  Main Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 07.05.2021.
//

import SwiftUI


struct Main_Screen: View {
    
    @EnvironmentObject var viewModel: ActivityViewModel
    @EnvironmentObject var location: LocationFetcher
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: true) {
                ActivityMainView(activities: viewModel.activities)
                Category_Home()
            }
        }
        .navigationBarTitle(Text("Путешествия"), displayMode: .large)
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {location.fetchingLocation()}
    }
}
