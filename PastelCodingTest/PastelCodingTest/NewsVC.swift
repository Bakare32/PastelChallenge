//
//  ViewController.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class NewsVC: UIViewController {
    // MARK: - Properties
    var coordinator: MainCoordinator?
    let newsViewModel = NewsViewModel()
    private var navigationBar = UIView().manualLayoutable()
    private var topNewsBar = UIView().manualLayoutable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getStories()
    }
    
    // MARK: - Visual Setup
    func configureUI() {
        setBackgroundColor()
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }
    
    func setUpProperties() {
        navigationBar = NavigationBarView(title: "Newsfeed" )
        navigationBar.manualLayoutable()
        
        topNewsBar = TopNewsView(title: "Top News")
        topNewsBar.manualLayoutable()
    }
    
    func setupHierarchy() {
        view.addSubview(navigationBar)
        view.addSubview(topNewsBar)
    }
    
    func setUpAutoLayout() {
        navigationBar.apply {
            $0.backgroundColor = LIGHT_VIEW_COLOR
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: 60).activate()
        }
        
        topNewsBar.apply {
            $0.backgroundColor = BLACK_COLOR
            $0.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: 30).activate()
        }
        
    }
    
    func getStories() {
        newsViewModel.getNews(apiKey: api_key)
        newsViewModel.fetchAllNews()
    }


}

