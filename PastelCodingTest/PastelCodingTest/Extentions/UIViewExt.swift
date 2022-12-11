//
//  UIViewExt.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit


extension UIView {
    
    func viewBackgroundWhite() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemBackground
        } else {
            self.backgroundColor = WHITE_COLOR
        }
    }
    
    @discardableResult
    func manualLayoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func isManualLayoutEnabled(_ isOn: Bool) -> Self {
        return self.apply {
            $0.translatesAutoresizingMaskIntoConstraints = !isOn
        }
    }
    
    func roundedBg(bgColor: UIColor? = TRANSPARENT, radius: CGFloat? = 13.0) {
        layer.cornerRadius = radius!
        layer.masksToBounds = true
        layer.backgroundColor = bgColor?.cgColor
    }
    
    /// Anchor of the view
    enum Anchor: CaseIterable {
        case top
        case trailing
        case bottom
        case leading
    }

}

