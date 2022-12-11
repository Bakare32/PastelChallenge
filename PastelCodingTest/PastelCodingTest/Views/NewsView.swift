//
//  NewsView.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

private let cellID = "CellID"

class NewsView: UIView {
    
    var newsList = [NewsRealmModel]()
    var coordinator: MainCoordinator?
    
    var selectedIndex: Int = 0
    var btnAction: (() -> Void)?
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    private var  forYouCollectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHeirarchy()
        setUpAutoLayout()
    }
    
    convenience init(newsList: [NewsRealmModel]) {
        self.init(frame: .zero)
        self.newsList = newsList
        self.forYouCollectionView?.reloadData()
    }
    
    private func setUpProperties() {
        
        self.apply {
            $0.viewBackgroundWhite()
        }
        
        
//        let flowLayout = UICollectionViewFlowLayout()
//        screenSize = UIScreen.main.bounds
//        screenWidth = screenSize.width
//        screenHeight = screenSize.height
////        flowLayout.estimatedItemSize = CGSize(width: 210, height: 200)
//        flowLayout.scrollDirection = .vertical
//        flowLayout.minimumInteritemSpacing = 0
//        flowLayout.minimumLineSpacing = 0
//
//        forYouCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).manualLayoutable()
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        forYouCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = forYouCollectionView else {
            return
        }
        
        collectionView.manualLayoutable()
        
        
        forYouCollectionView?.apply {
            $0.backgroundColor = .clear
            $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.register(NewsCell.self, forCellWithReuseIdentifier: cellID)
            $0.delegate = self
            $0.dataSource = self
        }
        
    }
    
    private func setupHeirarchy() {

        addSubview(forYouCollectionView ?? UICollectionView())
        
    }
    
    private func setUpAutoLayout() {
 
        forYouCollectionView?.apply {
            $0.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0).activate()
            $0.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
        }
        
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: collectionView.bounds.width, height: 200)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)  as! NewsCell
        let item = newsList[indexPath.row]
        if item.urlToImage == nil {
            cell.imgView.setImage(string: "\(String(describing: ""))", color: UIColor.random, stroke: false)
        } else {
            cell.imgView.loadImage(fromURL: item.urlToImage ?? "", placeholder: UIImage(color: LIGHT_VIEW_COLOR, iv: cell.imgView))
        }
        cell.lblTitle.text = item.title ?? ""
        cell.lblAuthor.text = item.author
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("yess")
        let obj = newsList[indexPath.row]
        debugPrint(obj.url)
        debugPrint(obj.title)
        coordinator?.openWebView(pageTitle: obj.title ?? "", pageURL: obj.url ?? "")
    }
    
}

