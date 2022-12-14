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
    
    func openWebView(pageTitle: String, pageURL: String) {
        let vc = WebViewVC()
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        vc.pageTitle = pageTitle
        vc.pageUrl = pageURL
        navigationController.present(vc, animated: true)
//        navigationController.pushViewController(vc, animated: false)
    }
    
}
