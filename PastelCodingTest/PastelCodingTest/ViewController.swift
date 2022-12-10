//
//  ViewController.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class ViewController: UIViewController {

    let newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        getStories()
    }
    
    func getStories() {
        newsViewModel.getNews(apiKey: api_key)
        newsViewModel.fetchAllNews()
    }


}

