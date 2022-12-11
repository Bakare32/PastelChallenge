//
//  ViewController.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit
import RealmSwift

class NewsVC: UIViewController {
    // MARK: - Properties
    var coordinator: MainCoordinator?
    let newsViewModel = NewsViewModel()
    private var navigationBar = UIView().manualLayoutable()
    private var topNewsBar = UIView().manualLayoutable()
    var newsView = NewsView().manualLayoutable()
    
    var newsToken: NotificationToken?
    
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
        setupListenersObservers()
    }
    
    func setUpProperties() {
        navigationBar = NavigationBarView(title: "Newsfeed" )
        navigationBar.manualLayoutable()
        
        topNewsBar = TopNewsView(title: "Top News")
        topNewsBar.manualLayoutable()
        
        newsView = NewsView(newsList: [])
        newsView.coordinator = coordinator
        newsView.manualLayoutable()
    }
    
    func setupHierarchy() {
        view.addSubview(navigationBar)
        view.addSubview(topNewsBar)
        view.addSubview(newsView)
    }
    
    func setUpAutoLayout() {
        navigationBar.apply {
            $0.backgroundColor = BLACK_COLOR.withAlphaComponent(0.5)
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).activate()
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
        
        newsView.apply {
            $0.topAnchor.constraint(equalTo: topNewsBar.bottomAnchor, constant: 0).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).activate()
        }
        
    }
    
    func getStories() {
        newsViewModel.getNews(apiKey: api_key)
        newsViewModel.fetchAllNews()
    }
    
    func setupListenersObservers() {
        addObserverOnStories()
    }


}


extension NewsVC {
    
    func addObserverOnStories() {
        
        let newsCollectionView = newsView.subviews.first(where: { $0 is UICollectionView })
        
        let results = realmDB.objects(NewsRealmModel.self)
        newsToken = results.observe { [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = newsCollectionView as? UICollectionView else { return }
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self?.setUpStoryListener()
                collectionView.reloadData()
                debugPrint("NEWS INITIAL UPDATE!!!!!")
            case .update(_, _, _, _):
                // Query results have changed, so apply them to the UITableView
                //self?.setUpTableView()
                debugPrint("NEWS CHANGES!!!!")
                self?.setUpStoryListener()
                collectionView.reloadData()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("NOTIFICATION ERROR -> \(error)")
            }
        }
    }
    
    func setUpStoryListener() {
        
        newsView.newsList = newsViewModel.newsList
        let newsCollectionView = newsView.subviews.first(where: { $0 is UICollectionView }) as? UICollectionView
        
        if newsViewModel.newsList.count > 0 {
            newsView.isHidden = false
            newsCollectionView?.reloadData()
        } else {
//            newsCollectionView?.isHidden = true
        }
    }
}
