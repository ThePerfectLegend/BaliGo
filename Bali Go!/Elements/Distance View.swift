//
//  Distance View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 08.06.2021.
//

import SwiftUI
import Foundation

struct Distance_View: View {
    
    @EnvironmentObject var location: LocationFetcher
    
    var ladnmark: Landmark
    var showMark: Bool
    
    let measurementFormatter = MeasurementFormatter()
    let lenghtUnits: [UnitLength] = [.meters, .kilometers]
    
    var calculatedDistance: String {
        if let userLocation = location.userLocation {
            let _distance = userLocation.distance(from: ladnmark.location)
            if _distance < 1000 {
                return convertDistance(distance: _distance, from: .meters, to: .meters, numbers: 0)
            } else if _distance >= 1000 && _distance <= 100000 {
                return convertDistance(distance: _distance, from: .meters, to: .kilometers, numbers: 1)
            } else {
                return convertDistance(distance: _distance, from: .meters, to: .kilometers, numbers: 0)
            }
        } else {
            return ""
        }
    }
    
    func convertDistance(distance: Double, from: UnitLength, to: UnitLength, numbers: Int) -> String {
        measurementFormatter.numberFormatter.maximumFractionDigits = numbers
        measurementFormatter.unitOptions = .providedUnit
        let input = Measurement(value: distance, unit: from)
        let output = input.converted(to: to)
        return measurementFormatter.string(from: output)
    }
    
    var showDistance: Bool {
        if location.userLocation != nil {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        HStack {
            if showDistance {
                if showMark {
                    Image(systemName: "location.fill")
                    Text(calculatedDistance)
                } else {
                    Text(calculatedDistance) }
            } else {
                EmptyView()
            }
        }
    }
}
