//
//  NewsViewModel.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import Foundation
import RealmSwift
import Alamofire


class NewsViewModel: ApiHelper {
    
    var newsList = [NewsRealmModel]()
    var dataSource = RealmLocalDataSource(realm: realmDB)
    
    var baseError: ((String, Int) -> Void)?
    
    init() {
        fetchAllNews()
    }
    
    func saveNews(news: [NewsRealmModel]) {
        dataSource.realmSaveNews(news: news)
    }
    
    func fetchAllNews() {
        newsList = dataSource.fetchAllNews()
    }
    
    func getNews(apiKey: String) {
        AF.request(BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: setHeader(auth: apiKey)).responseDecodable(of: NewsModel.self) { response in
            switch response.result {
            case .success(let data):
                debugPrint("Success stories load!!")
                self.newsList = []
                data.articles?.forEach({ obj in
                    let newsRealm = NewsRealmModel(title: obj.title, author: obj.author, urlToImage: obj.urlToImage ,url: obj.url)
                    self.newsList.append(newsRealm)
                })
                
                debugPrint("the newslist is \(self.newsList)")
                self.saveNews(news: self.newsList)
                
            case .failure(let error):
                debugPrint("Response -> \(error)")
            }
        }
    }
}
