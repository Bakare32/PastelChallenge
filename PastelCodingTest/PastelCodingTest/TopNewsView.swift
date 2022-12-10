//
//  TopNewsView.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class TopNewsView: UIView {

    var titleLabel = UILabel().manualLayoutable()
    var blurEffectView = UIVisualEffectView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setUpAutoLayout()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        titleLabel.text = title
    }
    
    private func setUpProperties() {
        
        addSubview(titleLabel)
        
        self.apply {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = $0.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.alpha = 0
            $0.addSubview(blurEffectView)
            $0.sendSubviewToBack(blurEffectView)
        }
        
        titleLabel.apply {
            $0.numberOfLines = 2
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = WHITE_COLOR
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        }
        
    }
    
    private func setUpAutoLayout() {
        titleLabel.apply {
            $0.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
