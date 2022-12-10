//
//  Cordinator.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
