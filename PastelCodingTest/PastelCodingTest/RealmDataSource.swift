//
//  RealmDataSource.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import Foundation
import RealmSwift

final class RealmLocalDataSource {
    
    
    init(realm: Realm) {
        realmDB = realm
    }
    
    // START News
    func realmSaveNews(news: [NewsRealmModel]) {
        do {
            try realmDB.write({
                realmDB.add(news, update: .all)
            })
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func fetchAllNews() -> [NewsRealmModel] {
        return Array(realmDB.objects(NewsRealmModel.self))
    }
    
}

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
