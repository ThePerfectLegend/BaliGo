//
//  Likeable.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 22.04.2022.
//

import Foundation

protocol Likeable {
    associatedtype isLiked: Hashable
    associatedtype type: Hashable
    
    var isLiked: Self.isLiked { get }
    var type: Self.type { get }
    
}
