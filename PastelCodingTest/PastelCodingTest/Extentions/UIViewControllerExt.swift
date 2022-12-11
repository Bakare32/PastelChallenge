//
//  UIViewControllerExt.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

extension UIViewController {
    
//    func swipeToPop() {
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(popSwipe(_:)))
//        rightSwipe.direction = .right
//        self.view.addGestureRecognizer(rightSwipe)
//    }
    
    
    func setBackgroundColor() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = WHITE_COLOR
        }
    }
    
}
