//
//  UIButtonExt.swift
//  PastelCodingTest
//
//  Created by mac on 11/12/2022.
//

import UIKit

extension UIButton {
    func backButtonImage() {
        addBtnImage(image: UIImage(named: "back_arrow"), dimensions: 24)
    }
}

extension UIButton {
    func addBtnImage(image: UIImage?, dimensions: CGFloat) {
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: dimensions).isActive = true
        imageView?.heightAnchor.constraint(equalToConstant: dimensions).isActive = true
    }
}
