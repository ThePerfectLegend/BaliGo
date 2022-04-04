//
//  DifferenceBetweenArrays.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        let tempArray = Array(thisSet.symmetricDifference(otherSet))
        var rightArray = [Element]()
        for item in tempArray {
            if thisSet.contains(item) {
                rightArray.append(item)
            }
        }
        return rightArray
    }
}
