//
//  NewsCell.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    let bgView = UIView().manualLayoutable()
    let lblTitle = UILabel().manualLayoutable()
    var imgView = UIImageView().manualLayoutable()
    let lblAuthor = UILabel().manualLayoutable()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.contentMode = .scaleAspectFill
//        imgView.layer.cornerRadius = 13
        imgView.layer.masksToBounds = true
        imgView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        imgView.sd_cancelCurrentImageLoad()
        imgView.image = nil
        lblTitle.text = nil
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    fileprivate func setUpProperties() {
        
        bgView.apply {
            $0.backgroundColor = .clear
        }
        
        lblTitle.apply {
            $0.textColor = WHITE_COLOR
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textAlignment = .left
            $0.numberOfLines = 0
        }
        
        lblAuthor.apply {
            $0.textColor = LABEL_COLOR
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        
    }
    
    fileprivate func setupHierarchy() {
        addSubview(bgView)
        bgView.addSubview(imgView)
        bgView.addSubview(lblTitle)
        bgView.addSubview(lblAuthor)
    }
    
    fileprivate func setUpAutoLayout() {
        
        bgView.apply {
            $0.topAnchor.constraint(equalTo: topAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
            $0.leftAnchor.constraint(equalTo: leftAnchor).activate()
            $0.rightAnchor.constraint(equalTo: rightAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: 200).activate()
        }
        
        imgView.apply {
            $0.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0).activate()
            $0.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: 0).activate()
            $0.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 0).activate()
            $0.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: 0).activate()
        }
      
        
        lblTitle.apply {
            $0.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15).activate()
            $0.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -15).activate()
            $0.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -35).activate()
        }
        
        
        lblAuthor.apply {
            $0.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5).activate()
            $0.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15).activate()
        }

    }
    
}
