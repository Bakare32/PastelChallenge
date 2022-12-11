//
//  NewsRealmModel.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import Foundation
import RealmSwift

class NewsRealmModel: Object {
    
    @Persisted var id: Int?
    @Persisted (primaryKey: true) var title: String?
    @Persisted var author: String?
    @Persisted var urlToImage: String?
    @Persisted var url: String?
    
    convenience init(
        id: Int? = 0,
        title: String? = "",
        author: String? = "",
        urlToImage: String? = "",
        url: String? = "" ) {
            self.init()
            self.id = id
            self.title = title
            self.author = author
            self.urlToImage = urlToImage
            self.url = url
        }
    
}
