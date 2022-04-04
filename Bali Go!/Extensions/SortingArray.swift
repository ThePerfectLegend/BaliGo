//
//  SortingArray.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import Foundation

extension Array {
    mutating func propertySort<T: Comparable>(_ property: (Element) -> T) {
        sort(by: { property($0) > property($1) })
    }
}
