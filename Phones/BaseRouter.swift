//
//  BaseRouter.swift
//  MyTaxi
//
//  Created by Mirjalol Bahodirov on 5/22/18.
//  Copyright © 2018 NewMax. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter {
    
    var viewController: UIViewController!
    
    func show(window: UIWindow?) {
        
        let navigationController = UINavigationController(rootViewController: self.viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    func pushTo(navigationController: UINavigationController?, animated: Bool) {
        
        navigationController?.pushViewController(viewController, animated: animated)
        
    }
    
    func pushToRoot(navigationController: UINavigationController?, animated: Bool) {
        navigationController?.setViewControllers([viewController], animated: animated)
    }
    
}
