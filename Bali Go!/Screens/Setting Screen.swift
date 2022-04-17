////
////  Setting Screen.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 03.11.2021.
////

import SwiftUI
import LinkPresentation
import StoreKit

struct Setting_Screen: View {
    
    @EnvironmentObject var route: UserPreferencesViewModel
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Карта и навигация")) {
                    Picker("Тип карты", selection: $route.mapType) {
                        ForEach(UserPreferencesViewModel.MapType.allCases) { maps in
                            if maps != route.mapType {
                                Text(maps.rawValue)
                                    .navigationBarTitle("Тип карты", displayMode: .inline)
                            } else { Text(maps.rawValue) }
                        }
                    }
                                        
                    Picker("Строить маршрут в", selection: $route.routeApp) {
                        ForEach(UserPreferencesViewModel.RouteApp.allCases) { apps in
                            if apps != route.routeApp {
                                Text(apps.rawValue)
                                    .navigationBarTitle("Маршрут", displayMode: .inline)
                            } else {  Text(apps.rawValue) }
                        }
                    }
                }
                
                Section(header: Text("Оценка и рекомендации")) {
                    Button("Оценить Bali Go!") {
                        writeReview()
                    }
                    
                    Button("Поделиться Bali Go!") {
                        showAppShareSheet()
                    }
                }
            }
            .navigationBarTitle("Настройки", displayMode: .large)
            .onChange(of: route.routeApp) { _ in route.routeAppSave() }
            .onChange(of: route.mapType) { _ in route.mapOptionsSave() }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func writeReview() {
        /// поставить оценку приложению без отзыва. По гайдлайну дергать этот метот при нажатии кнопки нельзя
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
        /// написать отзыв
//            do { UIApplication.shared.open(URL(string: "https://apps.apple.com/app/id1580667720?action=write-review")!) }
    }
}
