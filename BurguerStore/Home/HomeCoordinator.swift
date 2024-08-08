//
//  HomeCoordinator.swift
//  BurguerStore
//
//  Created by Fabricio Henrique on 06/08/24.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start(){
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        window?.rootViewController = navigationController
    }
}

