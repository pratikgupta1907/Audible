//
//  NAVIGATIONCONTROLLER.swift
//  Audible
//
//  Created by pratik gupta on 17/09/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if isLoggedIn() {
            // user is loggeg in
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLogInController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    @objc func showLogInController() {
        let logInController = LoginViewController()
        present(logInController, animated: true, completion: nil)
    }
}
