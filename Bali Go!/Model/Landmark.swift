//
//  Landmark.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 13.04.2021.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit


struct Landmark: Codable, Identifiable, Hashable {
    
    static let type = "Landmark"
        
    var id: Int
    var name: String
    var description: String
    var shortDescription: String = ""
    var isLiked: Bool = false
    
    let island: Island
    let region: Region
    let subRegion: SubRegion
    var state: String
    var visibleAddress: String {
        "\(state), \(subRegion.rawValue), \(region.rawValue), \(island.rawValue)"
    }
    
    var type: String
    var category: Category
    let uponCategory: UponCategory
    
    enum Category: String, Codable, CaseIterable {
        case Waterfalls = "Водопады"
        case Parks = "Парки"
        case Culture = "Культура"
        case Beaches = "Пляжи"
        case Mountains = "Вулканы"
        case Lakes = "Озера"
    }
    
    enum UponCategory: String, Codable, CaseIterable {
    case Culture = "Культура"
    case Natute = "Природа"
    case Beaches = "Пляжи"
    }
    
    var imagesNames: [String]
    var imagesScroll: [Image] {
        imagesFromArray()
    }
    
    /// рудимент, логика более не используется т.к осталась одна картинка
    func imagesFromArray () -> [Image] {
       var imagesScroll: [Image] = []
       for item in imagesNames {
           imagesScroll.append(Image(item))
       }
       return imagesScroll
   }
    
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
    
    var location: CLLocation {
        CLLocation(
            latitude: latitude,
            longitude: longitude)
    }
    
    
    var internalRate: Double 
    var internalSubRate: Double 
    var isVisited: Bool = false
    
    var categoryRate: Double {
        switch category {
        case .Waterfalls:
            return 10
        case .Culture:
            return 9
        case .Parks:
            return 8
        case .Beaches:
            return 7
        case .Mountains:
            return 6
        case .Lakes:
            return 5
        }
    }
    
    var activitiesOnLandmark = [Int]()
    
//    var optionDesc1 : [String: String] = [:]
//    var optionDesc2 : [String: String] = [:]
//    var optionDesc3 : [String: String] = [:]
//    var optionDesc4 : [String: String] = [:]
//    var optionDesc5 : [String: String] = [:]
//    var optionDesc6 : [String: String] = [:]
//    var optionDesc7 : [String: String] = [:]
//
//    var discriptionData : [[String: String]] {
//       let dataArray = [
//            optionDesc1,
//            optionDesc2,
//            optionDesc3,
//            optionDesc4,
//            optionDesc5,
//            optionDesc6,
//            optionDesc7
//        ]
//
//        var validatedArray : [[String: String]] {
//
//        var tempArray = [[String: String]]()
//
//            for item in dataArray {
//                if item.isEmpty == false {
//                    tempArray.append(item)
//                }
//            }
//            return tempArray
//        }
//        return validatedArray
//    }

    
    
    
    enum Island: String, Codable, CaseIterable {
        case Bali = "Bali"
        case Java = "Java"
        case Lembongan = "Nusa Lembongan"

    }
    
    enum Region: String, Codable, CaseIterable {
        case Badung = "Badung"
        case Bangli = "Bangli"
        case Buleleng = "Buleleng"
        case Gianyar = "Gianyar"
        case Jembrana = "Jembrana"
        case Karangasem = "Karangasem"
        case Klungkung = "Klungkung"
        case Tabanan = "Tabanan"
        case Denpasar = "Denpasar City"
    }
    
    enum SubRegion: String, Codable, CaseIterable {
        case Blahbatuh = "Blahbatuh"
        case SouthKuta = "South Kuta"
        case Baturiti = "Baturiti"
        case Tampaksiring = "Tampaksiring"
        case Abang = "Abang"
        case Ubud = "Kec. Ubud"
        case Tegallalang = "Kec. Tegallalang"
        case Bebandem = "Bebandem"
        case Sukasada = "Sukasada"
        case Gianyar = "Kec. Gianyar"
        case Susut = "Susut"
        case Manggis = "Kec. Manggis"
        case Mengwi = "Kec. Mengwi"
        case Bangli = "Kec. Bangli"
        case Sukawati = "Sukawati"
        case Tembuku = "Tembuku"
        case Abiansemal = "Kec. Abiansemal"
        case Kediri = "Kediri"
        case Dawan = "Kec. Dawan"
        case Rendang = "Rendang"
        case Penebel = "Penebel"
        case Kuta = "Kuta"
        case Sawan = "Sawan"
        case Petang = "Petang"
        case DenpasarSel = "Denpasar Selatan"
        case Karangasem = "Kec. Karangasem"
        case KutaUtara = "Kuta Utara"
        case Kintamani = "Kintamani"
    }
    

}


