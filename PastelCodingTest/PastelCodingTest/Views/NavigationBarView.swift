//
//  NavigationBarView.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class NavigationBarView: UIView {
    
    var largeTitlelabel = UILabel().manualLayoutable()
    var blurEffectView = UIVisualEffectView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpProperties()
        setUpAutoLayout()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        largeTitlelabel.text = title
    }
    
    private func setUpProperties() {
        
        addSubview(largeTitlelabel)
        
        self.apply {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = $0.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.alpha = 0
            $0.addSubview(blurEffectView)
            $0.sendSubviewToBack(blurEffectView)
        }
        
        largeTitlelabel.apply {
            $0.numberOfLines = 2
            $0.font = UIFont.systemFont(ofSize: 20)
            $0.textColor = PRIMARY_TEXT_COLOR
            $0.adjustsFontSizeToFitWidth = true
            $0.minimumScaleFactor = 0.5
        }
        
    }
    
    private func setUpAutoLayout() {
        
        largeTitlelabel.apply {
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).activate()
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        }
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
