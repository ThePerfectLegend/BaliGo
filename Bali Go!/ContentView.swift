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
                
                ActivityDetailCard()
                    .tabItem {Label("Developing", systemImage: "bonjour" )}
                    .tag("Developing")
                
                
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
            .environmentObject(ModelData())
            
    }
}



//import SwiftUI
//import UIKit
//
//struct ContentView: View {
//    
////    init() {
////        let appearance = UINavigationBarAppearance()
////        appearance.configureWithOpaqueBackground()
////        navigationBar.standardAppearance = appearance
////    }
//    
//    @EnvironmentObject var location: LocationFetcher
//    @EnvironmentObject var route: RouteModel
//    
//    var body: some View {
//        
//            TabView {
//                
//                Main_Screen()
//                    .tabItem {Label("Главная", systemImage: "square.grid.2x2.fill")}
//                    .tag("Home")
//                   
//                Like_Screen()
//                    .tabItem {Label("Избранное", systemImage: "heart.fill")}
//                    .tag("Liked")
//                        
//                Map_Screen()
//                    .tabItem {Label("Карта", systemImage: "map.fill" )}
//                    .tag("Map")
//                
//                Setting_Screen()
//                    .tabItem {Label("Настройки", systemImage: "gear" )}
//                    .tag("Settings")
//       
//            }
//            .accentColor(.baliGo)
//    }
//}









//    init() {
//        UITabBar.appearance().unselectedItemTintColor = UIColor.systemPink
//        UITabBar.appearance().tintColor = UIColor.systemPurple
//        UITabBar.appearance().isTranslucent = true
//
//    }

//
//
//struct ContentView: View {
//
//    @State private var home = UUID()
//    @State private var liked = UUID()
//    @State private var map = UUID()
//
//    @State private var tabSelection = 2
//    @State private var tappedTwice = false
//
//    var handler: Binding<Int> { Binding(
//            get: { self.tabSelection },
//            set: {
//                    if $0 == self.tabSelection {
//                            tappedTwice = true
//                    }
//                    self.tabSelection = $0
//            }
//    )}
//
//    var body: some View {
//        return TabView(selection: handler)  {
//
//            Main_Screen()
//                .tabItem {Label("Главная", systemImage: "square.grid.2x2.fill")}
//                .onChange(of: tappedTwice, perform: { tappedTwice in
//                    guard tappedTwice else { return }
//                    home = UUID()
//                    self.tappedTwice = false})
//                .tag("Home")
//                .id(home)
//
//            Like_Screen()
//                .tabItem {
//                    Label("Избранное", systemImage: "heart.fill")
//            }
//                .onChange(of: tappedTwice, perform: { tappedTwice in
//                    guard tappedTwice else { return }
//                    liked = UUID()
//                    self.tappedTwice = false})
//                .tag("Liked")
//                .id(liked)
//
//            Map_Screen()
//                .tabItem {
//                    Label("Карта", systemImage: "map.fill" )
//                }
//                .onChange(of: tappedTwice, perform: { tappedTwice in
//                    guard tappedTwice else { return }
//                    map = UUID()
//                    self.tappedTwice = false})
//                .tag("Map")
//                .id(map)
//        }
//        .background(
//            VisualEffectBlurView(blurStyle: .systemUltraThinMaterial)
//        )
//        .accentColor(.baliGo)
//    }
//}


//
//import SwiftUI
//import SwiftUIX
//import UIKit
//
//struct ContentView: View {
//
//    @EnvironmentObject var location: LocationFetcher
//    @State var animate = false
//    @State var endSplash = false
//
//
//
//    var body: some View {
//
//        ZStack {
//
//            TabView {
//
//                Main_Screen()
//                    .tabItem {Label("Главная", systemImage: "square.grid.2x2.fill")}
//                    .tag("Home")
//
//                Like_Screen()
//                    .tabItem {Label("Избранное", systemImage: "heart.fill")}
//                    .tag("Liked")
//
//                Map_Screen()
//                    .tabItem {Label("На карте", systemImage: "map.fill" )}
//                    .tag("Map")
//
//            }
//            .accentColor(.baliGo)
//
//            ZStack {
//
//                Color("BaliGo!secondary")
//
//                Image("stoneBig")
//                    .resizable()
//                    .renderingMode(.original)
//                    .aspectRatio(contentMode: animate ? .fill : .fit)
//                    .frame(width: animate ? nil : 120, height: animate ? nil : 120)
//                    .scaleEffect(animate ? 3 : 1)
//                    .frame(width: UIScreen.main.bounds.width)
//            }
//            .ignoresSafeArea(.all, edges: .all)
//            .onAppear(perform: animateSplash)
//            .opacity(endSplash ? 0 : 1)
//        }
//    }
//
//    func animateSplash() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//
//            withAnimation(Animation.easeInOut(duration: 0.55)) {
//                animate.toggle()
//            }
//
//            withAnimation(Animation.linear(duration: 0.45)) {
//                endSplash.toggle()
//            }
//        }
//    }
//}
