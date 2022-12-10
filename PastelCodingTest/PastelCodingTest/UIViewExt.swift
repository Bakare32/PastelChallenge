//
//  UIViewExt.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit


extension UIView {
    
    
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
    
    /// Anchor of the view
    enum Anchor: CaseIterable {
        case top
        case trailing
        case bottom
        case leading
    }

}

