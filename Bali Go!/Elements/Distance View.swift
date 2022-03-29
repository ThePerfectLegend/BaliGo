//
//  Distance View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 08.06.2021.
//

import SwiftUI
import Foundation

struct Distance_View: View {
    
    var ladnmark: Landmark
    var showMark: Bool
    
    @EnvironmentObject var location: LocationFetcher
    @EnvironmentObject var modelData: ModelData
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == ladnmark.id })!
    }
    
    
    let measurementFormatter = MeasurementFormatter()
    let lenghtUnits: [UnitLength] = [.meters, .kilometers]
    
    var calculatedDistance: String {
        if let userLocation = location.locationForDistance {
            let value = userLocation.distance(from: modelData.landmarks[landmarkIndex].location)
        if value > 999 {
            let result = convertDistance(distance: value, from: .meters, to: .kilometers, numbers: 1)
            return result
        }
        else {
            let result = convertDistance(distance: value, from: .meters, to: .meters, numbers: 0)
            return result
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
        if location.locationForDistance != nil {
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

