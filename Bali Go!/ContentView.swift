//
//  ContentView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 03.04.2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @EnvironmentObject var location: LocationFetcher
    @EnvironmentObject var route: UserPreferencesViewModel
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        
        ZStack {
        
            TabView {
                
//                Event_Screen()
//                    .tabItem {Label("Афиша", systemImage: "doc.text.image")}
//                    .tag("Billboard")
                
                Main_Screen()
                    .tabItem {Label("Путешествия", systemImage: "square.grid.2x2.fill")}
                    .tag("Home")
                   
                Like_Screen()
                    .tabItem {Label("Избранное", systemImage: "heart.fill")}
                    .tag("Liked")
                        
                Map_Screen()
                    .tabItem {Label("Карта", systemImage: "map.fill" )}
                    .tag("Map")
                
                Setting_Screen()
                    .tabItem {Label("Настройки", systemImage: "gear" )}
                    .tag("Settings")
//                
//                ActivityLandmarkView()
//                    .tabItem {Label("Developing", systemImage: "bonjour" )}
//                    .tag("Developing")
                
                
            }
            .accentColor(.baliGo)
            
            ZStack {

                Color("BaliGo!secondary")

                Image("stoneBig")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .scaleEffect(animate ? 5 : 1)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {

            withAnimation(Animation.easeInOut(duration: 0.55)) {
                animate.toggle()
            }

            withAnimation(Animation.linear(duration: 0.45)) {
                endSplash.toggle()
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LandmarkViewModel())
            
    }
}
