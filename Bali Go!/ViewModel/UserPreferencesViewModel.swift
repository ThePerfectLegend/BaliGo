//
//  UserPreferencesViewModel.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 03.11.2021.
//

import Foundation
import MapKit

final class UserPreferencesViewModel: ObservableObject {

    @Published var routeApp: RouteApp
    @Published var mapType: MapType
    @Published var currency: Currency = .RUB
    
    enum RouteApp: String, Codable, CaseIterable, Identifiable, Hashable {
        case appleMaps = "Apple Карты"
        case googleMaps = "Google Карты"
        
        var id: RouteApp {self}
    }
    
    enum MapType: String, Codable, CaseIterable, Identifiable, Hashable {
        case standard = "Схема"
        case satelliteFlyover = "Спутник"
        
        var id: MapType {self}
    }
    
    enum Currency: String, Codable, CaseIterable, Identifiable, Hashable {
        case RUB = "₽"
        case USD = "$"
        case IDR = "Rp"
        
        var id: Currency {self}
    }
    
    init() {
        /// загружаем приложение для навигации
        if let routeAppData = UserDefaults.standard.data(forKey: "routeApp") {
            if let decoded = try? JSONDecoder().decode(RouteApp.self, from: routeAppData) {
                self.routeApp = decoded
                print("RouteApp loaded from UserDefaults")
            } else { self.routeApp = .appleMaps }
        } else { self.routeApp = .appleMaps }

        /// загружаем тип отображаемой карты
        if let mapOptionData = UserDefaults.standard.data(forKey: "mapOptions") {
            if let decoded = try? JSONDecoder().decode(MapType.self, from: mapOptionData) {
                self.mapType = decoded
                print("MapOptions loaded from UserDefaults")
            } else { self.mapType = .standard }
        } else { self.mapType = .standard }
    }
    
    func routeAppSave() {
        if let encoded = try? JSONEncoder().encode(routeApp) {
            UserDefaults.standard.set(encoded, forKey: "routeApp")
            print("Route app changed and saved")
        }
    }
    
    func mapOptionsSave() {
        if let encoded = try? JSONEncoder().encode(mapType) {
            UserDefaults.standard.set(encoded, forKey: "mapOptions")
            print("Map type changed and saved")
        }
    }
}


