//
//  Route.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 03.11.2021.
//

import Foundation
import MapKit

final class RouteModel: ObservableObject {

    @Published var routeApp: RouteApp
    @Published var mapOptions: MapOptions
    
    enum RouteApp: String, Codable, CaseIterable, Identifiable, Hashable {
        case appleMaps = "Apple Maps"
        case googleMaps = "Google Maps"
        
        var id: RouteApp {self}
    }
    
    enum MapOptions: String, Codable, CaseIterable, Identifiable, Hashable {
        case standard = "Схема"
        case satelliteFlyover = "Спутник"
        
        var id: MapOptions {self}
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
            if let decoded = try? JSONDecoder().decode(MapOptions.self, from: mapOptionData) {
                self.mapOptions = decoded
                print("MapOptions loaded from UserDefaults")
            } else { self.mapOptions = .standard }
        } else { self.mapOptions = .standard }

    }
    
    
    func routeAppSave() {
        if let encoded = try? JSONEncoder().encode(routeApp) {
            UserDefaults.standard.set(encoded, forKey: "routeApp")
            print("Route app changed and saved")
        }
    }
    
    func mapOptionsSave() {
        if let encoded = try? JSONEncoder().encode(mapOptions) {
            UserDefaults.standard.set(encoded, forKey: "mapOptions")
            print("Map type changed and saved")
        }
    }

}


