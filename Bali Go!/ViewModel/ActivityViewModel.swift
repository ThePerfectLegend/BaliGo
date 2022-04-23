//
//  ActivityViewModel.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import Foundation

final class ActivityViewModel: ObservableObject {
    
    static let instance = ActivityViewModel()
    
    @Published var activities: [Activity]
    @Published var likedActivitiesId = Set<Int>()
    
    init() {
        self.activities = [climbingToBaturVolcano, ticketsToGili]
    }
    
    func save() {
        print("Activity Saved")
    }
}
