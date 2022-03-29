////
////  CloudKitUtility.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 07.02.2022.
////
//
//import Foundation
//import CloudKit
//
//class CloudKitUtility {
//
//    ///  получаем статус записи iCloud
//    static func getiCloudStatus(completion: @escaping(Result<Bool, Error>) -> ()) {
//        CKContainer.default().accountStatus { returnStatus, returnError in
//                switch returnStatus {
//                case .available:
//                    completion(.success(true))
//                case .noAccount:
//                    completion(.failure(CloudKitError.iCloudAccountNotFound))
//                case .couldNotDetermine:
//                    completion(.failure(CloudKitError.iCloudAccountNotDetermine))
//                case .restricted:
//                    completion(.failure(CloudKitError.iCloudAccountRestricted))
//                case .temporarilyUnavailable:
//                    completion(.failure(CloudKitError.iCloudAccountTemporarilyUnavailable))
//                @unknown default:
//                    completion(.failure(CloudKitError.iCloudAccountUnknown))
//                }
//
//        }
//    }
//
//
//
//
//    enum CloudKitError: String, LocalizedError {
//        case iCloudAccountNotFound
//        case iCloudAccountNotDetermine
//        case iCloudAccountRestricted
//        case iCloudAccountUnknown
//        case iCloudAccountTemporarilyUnavailable
//        case iCloudApplicationPermissionNotGranted
//        case iCloudCouldNotFetchUserRecordId
//        case iCloudCouldNotDiscoverUser
//    }
//
//}
//
////
////
/////// Разрешение на получение данных пользователя. Не срабатывает запрос?
////static func requestApplicationPermission(completion: @escaping(Result<Bool, Error>) -> ()) {
////    CKContainer.default().requestApplicationPermission([.userDiscoverability]) { returnedStatus, returnedError in
////        if returnedStatus == .granted {
////            completion(.success(true))
////        } else {
////            completion(.failure(CloudKitError.iCloudApplicationPermissionNotGranted))
////        }
////    }
////}
////
/////// Получение id пользователя в iCloud
////static private func fetchUserRecordId(completion: @escaping(Result<CKRecord.ID, Error>) -> ()) {
////    CKContainer.default().fetchUserRecordID { returnedID, error in
////        if let id = returnedID {
////            completion(.success(id))
////        } else {
////            completion(.failure(CloudKitError.iCloudCouldNotFetchUserRecordId))
////        }
////    }
////}
////
/////// получение имени пользователя в iCloud
////static private func discoverUserIdentity(id: CKRecord.ID, completion: @escaping(Result<String, Error>) -> ()) {
////    CKContainer.default().discoverUserIdentity(withUserRecordID: id) { returnedIdentity, returnedError in
////        if let name = returnedIdentity?.nameComponents?.givenName {
////            completion(.success(name))
////        } else {
////            completion(.failure(CloudKitError.iCloudCouldNotDiscoverUser))
////
////        }
////    }
////}
////
/////// получение данных пользователя
////static func discoverUserIdentity(completion: @escaping(Result<String, Error>) -> ()) {
////    fetchUserRecordId { fetchCompletion in
////        switch fetchCompletion {
////        case .success(let recordID):
////            CloudKitUtility.discoverUserIdentity(id: recordID, completion: completion)
////        case .failure(let error):
////            completion(.failure(error))
////        }
////    }
////}
