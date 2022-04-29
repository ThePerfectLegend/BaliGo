//
//  Model.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 18.04.2021.
//

import Foundation
import Combine


final class LandmarkViewModel: ObservableObject {
    
    static let instance = LandmarkViewModel()

    @Published var landmarks = [Landmark]()
    @Published var selectedLandmarks = [Landmark]()
    @Published var likedLandmarksId = Set<Int>()
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "BaliGo") {
            if let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
                self.likedLandmarksId = decoded
                for item in landscapes {
                    if likedLandmarksId.contains(item.id) {
                        var likedLandmark = item
                        likedLandmark.isLiked = true
                        landmarks.append(likedLandmark)
                        print("\(likedLandmark.id) ранее был лайкнут")
                    } else {
                        landmarks.append(item)
                    }
                }
                self.landmarks.propertySort({$0.internalSubRate + $0.categoryRate})
                self.selectedLandmarks = landmarks.randomSelection()
            return
            }
        }
        self.landmarks = landscapes
        self.landmarks.propertySort({$0.internalSubRate + $0.categoryRate})
        self.selectedLandmarks = landmarks.randomSelection()
        print("loaded by defaults")
    }
    
    func save(object: Landmark) {
        if object.isLiked == true {
            likedLandmarksId.insert(object.id)
            print("\(object.id) is added")
        } else {
            likedLandmarksId.remove(object.id)
            print("\(object.id) is deleted")
        }
        if let encoded = try? JSONEncoder().encode(likedLandmarksId) {
            UserDefaults.standard.set(encoded, forKey: "BaliGo")
            print("Saved")
        }
    }
    
    func getSuggestion() -> [Landmark] {
        let suggested = landmarks.filter { landmark in !landmark.isLiked }
        return suggested
    }
}
