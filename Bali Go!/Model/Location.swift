//
//  Location.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.06.2021.
//

import Foundation
import CoreLocation
import MapKit


class LocationFetcher: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    let manager = CLLocationManager()
    @Published var locationForDistance: CLLocation?
    @Published var showUserLocation = false
    
        override init() {
            super.init()
            manager.delegate = self
        }
    
    /// запрос у пользователя на сбор его локации
    func start() {
//        manager.delegate = self
            if manager.authorizationStatus == .notDetermined {
                manager.requestWhenInUseAuthorization()
//                manager.startUpdatingLocation()
            }
            if manager.authorizationStatus == .authorizedWhenInUse {
                manager.startUpdatingLocation()
            }
    }
    
    /// начинаем получать локацию при загрузке вью к которой прикреплена функция
    func getLocation() {
        if manager.authorizationStatus == .authorizedWhenInUse {
            manager.delegate = self
            manager.startUpdatingLocation()
        }
    }

    /// обеспечивает обновление переменной при обновлении локации
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationForDistance != nil {
            let tempDistance = locationForDistance!.distance(from: locations.last!)
            if tempDistance > 25 {
                locationForDistance = locations.last
            }
        } else {
            locationForDistance = locations.last
        }
    }
    
    /// наблюдает за изменением статуса возможности сбора локации
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            showUserLocation = true
            manager.startUpdatingLocation()
        }
        else {
            showUserLocation = false
            locationForDistance = nil
        }
    }
}



//
//class LocationFetcher: NSObject, CLLocationManagerDelegate, ObservableObject {
//
//    let manager = CLLocationManager()
//    @Published var lastKnownLocation: CLLocationCoordinate2D?
//    @Published var locationForDistance: CLLocation?
//
//    override init() {
//        super.init()
//        manager.delegate = self
//    }
//
//    /// запрос у пользователя на сбор его локации
//    func start() {
//        manager.requestWhenInUseAuthorization()
//    }
//
//
//    func getLocation() {
////        manager.startUpdatingLocation()
////        print("Collected from getLocation()")
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
////            self.manager.stopUpdatingLocation()
////            print("Stop collecting from getLocation()")
////        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
////        manager.startUpdatingLocation()
////        print("Collected distance from start()")
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
////            self.manager.stopUpdatingLocation()
////            print("Stop collecting from the start()")
////        }
//    }
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        lastKnownLocation = locations.first?.coordinate
//        locationForDistance = locations.first
//    }
//
//}
