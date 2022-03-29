//
//  MapViewModel.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 11.08.2021.


//import SwiftUI
import MapKit
import CoreLocation
import Foundation

/// ключ для  группировки достопримечательностей
let landmarkClusterID = "landmarkCluster"

/// Часть настраиваемых параметров карты и создание аннотаций

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    

    
    
    
    
    class LandmarkAnnotation: NSObject, MKAnnotation {
        
        let title: String?
        let subtitle: String?
        let coordinate: CLLocationCoordinate2D
        let type: Landmark.Category
        let id: Landmark.ID
        
        init(
             title: String,
             subtitle: String?,
             coordinate: CLLocationCoordinate2D,
             type: Landmark.Category,
             id: Landmark.ID
            
        ) {
            self.title = title
            self.subtitle = subtitle
            self.coordinate = coordinate
            self.type = type
            self.id = id
            
            super.init()
        }
        
    }
}



class CultureAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
            glyphImage = #imageLiteral(resourceName: "Culture")
//        glyphText = "C"
    }
}


class WaterfallAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
            glyphImage = #imageLiteral(resourceName: "Waterfalls")
//        glyphText = "W"
    }
}

class BeachAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
        glyphImage = #imageLiteral(resourceName: "Beaches")
//        glyphText = "B"
    }
}

class ParkAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
            glyphImage = #imageLiteral(resourceName: "Parks")
//        glyphText = "P"
    }
}


class MountAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
            glyphImage = #imageLiteral(resourceName: "Mountains")
//        glyphText = "M"
    }
}

class LakeAnnotationView: MKMarkerAnnotationView {
    
    static let ReuseID = "cultureAnnotation"
    
    /// устанавливаем по какому ключу объекты культуры будут группироваться
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = landmarkClusterID
    }
    
    /// ???
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
//        markerTintColor = UIColor.baliGo
//            glyphImage = #imageLiteral(resourceName: "unicycle")
//        glyphText = "L"
    }
}
