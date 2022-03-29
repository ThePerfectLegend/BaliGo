//
//  GO.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 12.02.2022.
//

import SwiftUI
import MapKit

struct Go: View {
    @EnvironmentObject var location: LocationFetcher
    @EnvironmentObject var route: RouteModel
    
    var coordinate: CLLocation
    
    var link: String {
        switch route.routeApp {
        case .googleMaps:
            if location.locationForDistance != nil {
                return String("https://www.google.com/maps/dir/?api=1&origin=\(location.locationForDistance!.coordinate.latitude),\(location.locationForDistance!.coordinate.longitude)&destination=\(coordinate.coordinate.latitude),\(coordinate.coordinate.longitude)")
            } else {
                return "https://www.google.com/maps/dir/?api=1&destination=\(coordinate.coordinate.latitude),\(coordinate.coordinate.longitude)"
            }
        case .appleMaps:
            if location.locationForDistance != nil {
                return String("http://maps.apple.com/?saddr=\(location.locationForDistance!.coordinate.latitude),\(location.locationForDistance!.coordinate.longitude)&daddr=\(coordinate.coordinate.latitude),\(coordinate.coordinate.longitude)")
            } else {
                return "http://maps.apple.com/?daddr=\(coordinate.coordinate.latitude),\(coordinate.coordinate.longitude)"
            }
        }
    }
    
    var body: some View {
        Button(action: {UIApplication.shared.open(URL(string: link)!)} ) {
            VStack{
                Text("Поехали!")
                    .font(.title3)
                    .fontWeight(.semibold)
//                Text("\(Image(systemName: "car.fill")) 1ч 27м")
//                    .font(.footnote)
            }
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(LinearGradient(gradient: Gradient(colors: [Color.baliGo, Color.baliGoSec]),
                                       startPoint: .init(x: 1.2, y: 0.21),
                                       endPoint: .init(x: -0.5, y: 0.79)))
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))

        }
    }
}


