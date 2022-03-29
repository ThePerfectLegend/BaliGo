//
//  Color.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 31.05.2021.
//

import SwiftUI

struct ColorManager {
    // create static variables for custom colors
    static let baliGo = Color("BaliGo!")
    static let baliGoSec = Color("BaliGo!secondary")
    

    //... add the rest of your colors here
}

// Or you can use an extension
// this will allow you to just type .spotifyGreen and you wont have to use ColorManager.spotifyGreen
extension Color {
    static let baliGo = Color("BaliGo!")
    static let baliGoSec = Color("BaliGo!secondary")
    
    // ... add the rest of your colors here
}

extension UIColor {
    static let cultureColor = UIColor(named: "Culture")
    static let waterfallsColor = UIColor(named: "Waterfalls")
    static let beachesColor = UIColor(named: "Beaches")
    static let mountainsColor = UIColor(named: "Mountains")
    static let parksColor = UIColor(named: "Parks")
    static let hotSpringsColor = UIColor(named: "Hot Springs")
    static let lakes = UIColor(named: "Lakes")
    static let POI = UIColor(named: "POI")
    static let baliGo = UIColor(named: "BaliGo!")
}


