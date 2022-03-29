//
//  Detail Map View.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 13.06.2021.
//

import SwiftUI
import MapKit

struct Detail_Map_View: View {
    var landmark: Landmark
    
    @State private var region = MKCoordinateRegion()
    
    func setRegion(forCenter: Landmark) {
        region = MKCoordinateRegion(
            center: forCenter.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.5)
        )
        print("Map Drowed")
    }
    
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: nil, annotationItems: [landmark]) {item in
                MapMarker(coordinate: item.coordinate, tint: .baliGo)
                        }
            .onAppear{setRegion(forCenter: landmark)}
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(landmark.name)
    }
}

struct Detail_Map_View_Previews: PreviewProvider {
    static var previews: some View {
        Detail_Map_View(landmark: landscapes[3])
    }
}
