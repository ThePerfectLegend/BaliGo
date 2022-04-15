////
////  EventModel.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 28.01.2022.
////  This part of code need to rework
//
//import Foundation
//import CloudKit
//import MapKit
//
//class EventModel: ObservableObject {
//    
//    @Published var events: [Event] = []
//    
//    @Published var isSignedToiCloud: Bool = false
//    @Published var iCloudStatusError: String = ""
//    @Published var selectedDate = Date()
//    
//    private var maxDate: Date {
//        let calendar = Calendar.current
//        let tempMaxDate = calendar.dateComponents([.year, .month, .day], from: calendar.date(byAdding: .day, value: 1, to: selectedDate)!)
//        return calendar.date(from: tempMaxDate)!
//    }
//    
//
//    
//    init() {
//        setDate()
//        getCloudKitStatus()
//        fetchEvents()
//    }
//    
//    func setDate() {
//        let date = Date()
//        let calendar = Calendar.current
//        
//        let eventDate = calendar.dateComponents([.year, .month, .day], from: date)
//        self.selectedDate = calendar.date(from: eventDate)!
//    }
//    
//    
//    func fetchEvents() {
//        
//        let predecate = NSPredicate(format: "(eventStartDate > %@) AND (eventStartDate < %@)", argumentArray: [selectedDate.toLocalTime(), maxDate.toLocalTime()])
//
//        let query = CKQuery(recordType: Event.recordType, predicate: predecate)
//        query.sortDescriptors = [NSSortDescriptor(key: "prio", ascending: false)]
//        let queryOperation = CKQueryOperation(query: query)
//        
//        var fetchedEvents: [Event] = []
//        
//        if #available(iOS 15.0, *) {
//            queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
//                switch returnedResult {
//                case .success(let record):
//                    
//                    let imageAsset = record["poster"] as! CKAsset
//                    let startDate = record["eventStartDate"] as! Date
//
//                     let fetchedEvent = Event(
//                        id: record.recordID,
//                        name: record["name"] as! String,
//                        place: record["place"] as! String,
//                        location: record["location"] as! CLLocation,
//                        imageURL: imageAsset.fileURL!,
//                        eventStartDate: startDate.toGlobalTime(),
//                        finishDate: record["finishDate"] as? Date,
//                        price: record["price"] as! [Int],
//                        prio: record["prio"] as! Double,
//                        description: record["description"] as? String,
//                        enterOption: record["enterOption"] as? String,
//                        guestListDeadline: record["guestListDeadline"] as? Date
//                    )
//                    
//                    fetchedEvents.append(fetchedEvent)
//                    print("\(fetchedEvent.name) fetched")
//                case .failure(let error):
//                    print("\(error)")
//                    
//                }
//            }
//        } else {
//            queryOperation.recordFetchedBlock = { (record) in
//                
//                let imageAsset = record["poster"] as! CKAsset
//                let startDate = record["eventStartDate"] as! Date
//
//                 let fetchedEvent = Event(
//                    id: record.recordID,
//                    name: record["name"] as! String,
//                    place: record["place"] as! String,
//                    location: record["location"] as! CLLocation,
//                    imageURL: imageAsset.fileURL!,
//                    eventStartDate: startDate.toGlobalTime(),
//                    finishDate: record["finishDate"] as? Date,
//                    price: record["price"] as! [Int],
//                    prio: record["prio"] as! Double,
//                    description: record["description"] as? String,
//                    enterOption: record["enterOption"] as? String,
//                    guestListDeadline: record["guestListDeadline"] as? Date
//                )
//                fetchedEvents.append(fetchedEvent)
//            }
//    }
//        
//        
//        if #available(iOS 15.0, *) {
//            queryOperation.queryResultBlock = { [weak self] returnedResult in
//                DispatchQueue.main.sync {
//                    self?.events = fetchedEvents
//                }
//            }
//        } else {
//            queryOperation.queryCompletionBlock = { [weak self] (returnedCursor, returnError) in
//                DispatchQueue.main.sync {
//                    self?.events = fetchedEvents
//                }
//            }
//        }
//        addOperation(operation: queryOperation)
//    }
//    
//    func addOperation(operation: CKDatabaseOperation) {
//        CKContainer.default().publicCloudDatabase.add(operation)
//    }
//    
//    private func getCloudKitStatus() {
//        CKContainer.default().accountStatus { [weak self] returnStatus, returnError in
//            DispatchQueue.main.sync {
//                switch returnStatus {
//                case .couldNotDetermine:
//                    self?.iCloudStatusError = CloudKitError.iCloudAccountNotDetermine.localizedDescription
//                case .available:
//                    self?.isSignedToiCloud = true
//                case .restricted:
//                    self?.iCloudStatusError = CloudKitError.iCloudAccountRestricted.localizedDescription
//                case .noAccount:
//                    self?.iCloudStatusError = CloudKitError.iCloudAccountNotFound.localizedDescription
//                case .temporarilyUnavailable:
//                    self?.iCloudStatusError = CloudKitError.iCloudAccountTemporarilyUnavailable.localizedDescription
//                @unknown default:
//                    self?.iCloudStatusError = CloudKitError.iCloudAccountUnknown.localizedDescription
//                }
//            }
//        }
//    }
//    
//    enum CloudKitError: LocalizedError {
//        case iCloudAccountNotFound
//        case iCloudAccountNotDetermine
//        case iCloudAccountRestricted
//        case iCloudAccountUnknown
//        case iCloudAccountTemporarilyUnavailable
//    }
//}
