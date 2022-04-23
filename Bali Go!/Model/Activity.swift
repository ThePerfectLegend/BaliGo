//
//  Activity.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import Foundation

struct Activity: Codable, Identifiable, Hashable {
    
    static let type = "Activity"
    
    let id: Int
    let name: String
    let type: String
    let numberOfReviews: Int
    let rating: Double
    var isLiked: Bool = false
    let price: [UserPreferencesViewModel.Currency : Double]
    let image: String
    let description: String
    let milestoneContent: [[String: String]]
    let link: String
    let partner: String
    let priceOption: String
}
