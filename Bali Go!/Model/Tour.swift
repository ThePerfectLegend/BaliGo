//
//  Tour.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 26.10.2021.
//

import Foundation

struct Tour: Identifiable {
    
    var id: Int
    var name: String
    var link: String
    var image: String
    var tag: Array<Any>?
    var partner: Partner

    
    enum Partner: String, Codable, CaseIterable {
        case myBaliTrips = "My Bali Trips"
        case tripster = "Tripster"
    }
}


