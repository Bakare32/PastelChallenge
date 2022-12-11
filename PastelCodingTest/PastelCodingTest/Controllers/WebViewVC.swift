//
//  WebViewVC.swift
//  PastelCodingTest
//
//  Created by mac on 11/12/2022.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    // MARK: - Properties
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

}
