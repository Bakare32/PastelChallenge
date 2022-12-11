//
//  MainCordinator.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

class MainCoordinator: Coordinator {
   
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func popController(animated: Bool? = true) {
        navigationController.popViewController(animated: animated!)
    }
    
    func start() {
        let vc = NewsVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openWebView() {
        let vc = WebViewVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
