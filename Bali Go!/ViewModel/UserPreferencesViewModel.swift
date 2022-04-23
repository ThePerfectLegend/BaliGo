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
    @Published var currency: Currency = .IDR
    
    enum RouteApp: String, Codable, CaseIterable, Identifiable, Hashable {
        case appleMaps = "Apple Карты"
        case googleMaps = "Google Карты"
        
        var id: RouteApp {self}
    }
    
    enum MapType: String, Codable, CaseIterable, Identifiable, Hashable {
        case satelliteFlyover = "Спутник"
        case standard = "Схема"
        
        var id: MapType {self}
    }
    
    enum Currency: String, Codable, CaseIterable, Identifiable, Hashable {
        case IDR = "Rp"
        case USD = "$"
        case RUB = "₽"
        
        var id: Currency {self}
    }
    
    init() {
        /// загружаем приложение для навигации
        if let routeAppData = UserDefaults.standard.data(forKey: "routeApp") {
            if let decoded = try? JSONDecoder().decode(RouteApp.self, from: routeAppData) {
                self.routeApp = decoded
            } else { self.routeApp = .appleMaps }
        } else { self.routeApp = .appleMaps }

        /// загружаем тип отображаемой карты
        if let mapOptionData = UserDefaults.standard.data(forKey: "mapOptions") {
            if let decoded = try? JSONDecoder().decode(MapType.self, from: mapOptionData) {
                self.mapType = decoded
            } else { self.mapType = .satelliteFlyover }
        } else { self.mapType = .satelliteFlyover }
        
        /// получение валюты пользователя
        if let currencyOption = UserDefaults.standard.data(forKey: "currencyOption") {
            if let decoded = try? JSONDecoder().decode(Currency.self, from: currencyOption) {
                self.currency = decoded
            } else { self.currency = getUserCurrency() }
        } else { self.currency = getUserCurrency() }
        /// сохраняем полученную валюту чтобы более не ходить за ней в настройки устройства
        currencySave()
    }
    
    private func getUserCurrency() -> Currency {
        if let currency = Locale.current.currencyCode {
            switch currency {
            case "RUB":
                return .RUB
            case "USD":
                return .USD
            case "IDR":
                return .IDR
            default:
                return .IDR
            }
        } else {
            return .IDR
        }
    }
    
    func routeAppSave() {
        if let encoded = try? JSONEncoder().encode(routeApp) {
            UserDefaults.standard.set(encoded, forKey: "routeApp")
        }
    }
    
    func mapOptionsSave() {
        if let encoded = try? JSONEncoder().encode(mapType) {
            UserDefaults.standard.set(encoded, forKey: "mapOptions")
        }
    }
    
    func currencySave() {
        if let encoded = try? JSONEncoder().encode(currency) {
            UserDefaults.standard.set(encoded, forKey: "currencyOption")
        }
    }
}


