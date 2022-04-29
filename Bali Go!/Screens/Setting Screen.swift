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
    
    @EnvironmentObject var userPreferencesVM: UserPreferencesViewModel
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Тип карты", selection: $userPreferencesVM.mapType) {
                        ForEach(UserPreferencesViewModel.MapType.allCases) { maps in
                            if maps != userPreferencesVM.mapType {
                                Text(maps.rawValue)
                                    .navigationBarTitle("Тип карты", displayMode: .inline)
                            } else { Text(maps.rawValue) }
                        }
                    }
                                        
                    Picker("Строить маршрут в", selection: $userPreferencesVM.routeApp) {
                        ForEach(UserPreferencesViewModel.RouteApp.allCases) { apps in
                            if apps != userPreferencesVM.routeApp {
                                Text(apps.rawValue)
                                    .navigationBarTitle("Маршрут", displayMode: .inline)
                            } else {  Text(apps.rawValue) }
                        }
                    }
                    
                    Picker("Валюта", selection: $userPreferencesVM.currency) {
                        ForEach(UserPreferencesViewModel.Currency.allCases) { apps in
                            if apps != userPreferencesVM.currency {
                                Text(apps.rawValue)
                                    .navigationBarTitle("Валюта", displayMode: .inline)
                            } else {  Text(apps.rawValue) }
                        }
                    }
                    
                    Button {
                        showAppShareSheet()
                    } label: {
                        PickerLineDesign(systemName: "square.and.arrow.up", title: "Поделиться BaliGo!")
                    }
                }
            }
            .navigationBarTitle("Настройки", displayMode: .large)
            .onChange(of: userPreferencesVM.routeApp) { _ in userPreferencesVM.routeAppSave() }
            .onChange(of: userPreferencesVM.mapType) { _ in userPreferencesVM.mapOptionsSave() }
            .onChange(of: userPreferencesVM.currency) { _ in userPreferencesVM.currencySave() }
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
    
    struct PickerLineDesign: View {
        
        var systemName: String
        var title: String
        
        var body: some View {
            HStack {
                Image(systemName: systemName).font(.body.weight(.medium))
                    .frame(width: 20, height: 20, alignment: .center)
                Text(title).font(.body.weight(.medium))
            }
        }
    }
}
