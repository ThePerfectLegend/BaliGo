//
//  Main Screen.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 07.05.2021.
//

import SwiftUI


struct Main_Screen: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var location: LocationFetcher
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(showsIndicators: true) {
                    ActivityMainCard()
                    Category_Home()
                }
            }
            .navigationBarTitle(Text("Путешествия"), displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {location.fetchingLocation()}
    }
}
