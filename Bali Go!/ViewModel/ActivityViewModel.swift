//
//  ActivityViewModel.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import Foundation

final class ActivityViewModel: ObservableObject {
    
    static let instance = ActivityViewModel()
    
    @Published var activities = [Activity]()
    @Published var likedActivitiesId = Set<Int>()
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "likedActivities") {
            if let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
                self.likedActivitiesId = decoded
                for item in activitiesData {
                    if likedActivitiesId.contains(item.id) {
                        var likedActivity = item
                        likedActivity.isLiked = true
                        activities.append(likedActivity)
                        print("\(likedActivity.name) ранее был лайкнут")
                    } else {
                        activities.append(item)
                    }
                }
                return
            }
        }
        self.activities = activitiesData
        print("loaded by defaults")
        
    }
    
    func save(object: Activity) {
        if object.isLiked == true {
            likedActivitiesId.insert(object.id)
            print("\(object.id) is added")
        } else {
            likedActivitiesId.remove(object.id)
            print("\(object.id) is deleted")
        }
        if let encoded = try? JSONEncoder().encode(likedActivitiesId) {
            UserDefaults.standard.set(encoded, forKey: "likedActivities")
            print("Saved")
        }
    }
}
