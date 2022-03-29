//
//  Model.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 18.04.2021.
//

import Foundation
import Combine


final class ModelData: ObservableObject {

    
    @Published var landmarks = [Landmark]()
    @Published var selectedLandmarks = [Landmark]()
    @Published var likedLandmarksId = Set<Int>()
    
    init() {
        /// проверяем есть ли сохраненные данные на устройстве пользователя и декодируем их
        if let data = UserDefaults.standard.data(forKey: "BaliGo") {
            if let decoded = try? JSONDecoder().decode(Set<Int>.self, from: data) {
                
                print("Найдены сохраненные данные на устройстве")
                
                self.likedLandmarksId = decoded
                
                /// проверяем массив на наличие сохраненных данных
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
        /// изменение параметра isLiked
        print("\(object.id) changed to \(object.isLiked)")
        
        /// добавление/удаление элемента
        if object.isLiked == true {
            likedLandmarksId.insert(object.id)
            print("\(object.id) is added")
        } else {
            likedLandmarksId.remove(object.id)
            print("\(object.id) is deleted")
        }
        
        /// сохранение избранных локаций на устройстве пользователя
        if let encoded = try? JSONEncoder().encode(likedLandmarksId) {
            UserDefaults.standard.set(encoded, forKey: "BaliGo")
            print("Saved")
        }
    }
    
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

/// сортировка массива
extension Array {
    mutating func propertySort<T: Comparable>(_ property: (Element) -> T) {
        sort(by: { property($0) > property($1) })
    }
}

/// расширение формирующее набор локаций для главного экрана
extension Array where Element == Landmark {
    func randomSelection() -> [Landmark] {
        var tempArrayForPickUpLandmark = self
        for items in tempArrayForPickUpLandmark {
            /// при условии что
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
                /// количество элементов на главной прокрутке
                while arrayForMainScreen.count != 7
        return arrayForMainScreen
    }
}

/// расширение показывающее разницу между двух массивов
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


var landscapes = [batucaru, batur, canggu, legian, jemeluk, virgin, sanur, nusaDua, pandawa, melasti, jimbaran, lekeleke, banyumala, nungnung, gitgit, secumpul, sangeh, seminyak, kuta, jatiluwih, lempuyang, besakih, ulunDanuBeratan, goaLawah, tanahLot, tirtaGangga, garudaWisnu, uluwatuTemple, alingAling, agung, birdPark, ubudMonkeyForest, goaGajah, suwat, campuhan, tibumana, tegalananRiceTerrace, penglipuran, tirtaEmpul, tamanAyun, gunungKawi, botanicGarden, tukad, tegenungan, blueLagoon, balangan, dreamland, padangPadang, bingin, nyangNyang, nunggalan, uluwatuBeach, karmaKandara, sawangan, lipah]


var tours = [climbingToBatur1008, baturTrunyan1025, baturJeep20371, divingAmed940, divingBlueLagoon1024, ejoingDay20059, magicNorth16009, velobike11564, waterfallsAndTerrases10198, magicNorth729, waterfall969, northTour647, northWestTour, waterfall968, eastTour, waterfall967, instagramTour693, ubudTourBirdPark690, kintamaniTourHideCanyon687, beachTour793, agung924, uluwatuKecak, realBali11237, oneDayBest7699, ubud10492, simbolsBali8088, animals11105, helicopterBukit, helicopterBeaches, helicopterVulcano]


//init() {
//    if let data = UserDefaults.standard.data(forKey: "BaliGo") {
//        if let decoded = try? JSONDecoder().decode([Landmark].self, from: data) {
//            self.landmarks = decoded
//
//            /// проверка на соответсвие сохраненных элементов с исходником, они всегда будут различаться, получаем массив с экземлярами которые не сходяться с сохраненными данными
//            let diffenceItems = landscapes.difference(from: landmarks)
//                print("\(diffenceItems.count) landmarks for updating")
//                if diffenceItems.count > 0 {
//                    for item in diffenceItems {
//                        print(item.id)
//                        /// проверка на присутсвие несовпадающего элемента в ранее сохраненных данных, поиск по ID
//                        if let isLandmarkExistIndex = landmarks.firstIndex(where: {$0.id == item.id}) {
//                            /// если находим элемент в ранее сохраненных, то обновляем его
//                            let existedLandmarkIsLiked = landmarks[isLandmarkExistIndex].isLiked
//                            var updatedLandmark = item
//                            updatedLandmark.isLiked = existedLandmarkIsLiked
//                            landmarks[isLandmarkExistIndex] = updatedLandmark
//                            print("Landmark \(updatedLandmark.id) is updated")
//                        } else {
//                            /// если не находим, то добавляем
//                            landmarks.append(item)
//                            print("New landmark \(item.id) added")
//                        }
//                    }
//                    self.landmarks.propertySort({$0.internalSubRate + $0.categoryRate})
//                    save()
//                }
//            /// проверка на наличие лишних эелементов в массиве, на случай если захотим удалить какой-либо
//            let extraItems = landmarks.difference(from: landscapes)
//                print("\(extraItems.count) found")
//                if extraItems.count > 0 {
//                    ///  проверяем действительно ли элемент лишний и его нет в исходнике
//                    for item in extraItems {
//                        print("\(item.id) is cheking for deleting")
//                        if landscapes.first(where: {$0.id == item.id}) != nil {
//                            print("\(item.id) is valid, no deleting")
//                        } else {
//                            let extraLandmarkIndex = landmarks.firstIndex(where: {$0.id == item.id})
//                            landmarks.remove(at: extraLandmarkIndex!)
//                            print("\(item.id) is deleted")
//                            self.landmarks.propertySort({$0.internalSubRate + $0.categoryRate})
//                            save()
//                        }
//                    }
//                }
//            /// создаем  массвив элементов для главного экрана
//            self.selectedLandmarks = landmarks.randomSelection()
//        return
//        }
//    }
//    self.landmarks = landscapes
//    self.landmarks.propertySort({$0.internalSubRate + $0.categoryRate})
//    /// создаем  массвив элементов для главного экрана
//    self.selectedLandmarks = landmarks.randomSelection()
//    print("loaded by defaults")
//}

//func save() {
//    /// тут должна быть проверка элементов на Liked = true, добавление id в массив и сохранение данных
//    if let encoded = try? JSONEncoder().encode(landmarks) {
//        UserDefaults.standard.set(encoded, forKey: "BaliGo")
//        print("Saved")
//    }
//}
