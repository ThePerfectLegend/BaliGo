//
//  Location.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.06.2021.
//

import Foundation
import CoreLocation

final class LocationFetcher: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    lazy var manager: CLLocationManager = {
        [unowned self] in
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        _locationManager.distanceFilter = 25
        return _locationManager
        }()
    
    @Published var userLocation: CLLocation?
    @Published var showUserLocation = false
    
    
    func authorizationToUseLocation() {
        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
        if manager.authorizationStatus == .authorizedWhenInUse {
            fetchingLocation()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            fetchingLocation()
        } else {
            showUserLocation = false
            userLocation = nil
        }
    }
    
    func fetchingLocation() {
        manager.startUpdatingLocation()
        userLocation = manager.location
        showUserLocation = true
    }
    
}
