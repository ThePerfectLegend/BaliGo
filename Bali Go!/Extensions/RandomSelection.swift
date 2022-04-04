//
//  RandomSelection.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import Foundation

extension Array where Element == Landmark {
    func randomSelection() -> [Landmark] {
        var tempArrayForPickUpLandmark = self
        for items in tempArrayForPickUpLandmark {
            if items.internalRate == 0 {
                let index = tempArrayForPickUpLandmark.firstIndex(where: {$0.id == items.id})
                tempArrayForPickUpLandmark.remove(at: index!)
            }
        }
        var arrayForMainScreen = [Landmark]()
        repeat {
            let randomLandmark = tempArrayForPickUpLandmark.randomElement()!
            let randomLandmarkIndex = tempArrayForPickUpLandmark.firstIndex(where: {$0.id == randomLandmark.id})
                    tempArrayForPickUpLandmark.remove(at: randomLandmarkIndex!)
                    arrayForMainScreen.append(randomLandmark)
                }
                while arrayForMainScreen.count != 7
        return arrayForMainScreen
    }
}
