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
        return true
    }
    
    @objc func showLogInController() {
        let logInController = LoginViewController()
        present(logInController, animated: true, completion: {
            
        })
    }
}

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        view.addSubview(imageView) 
        navigationItem.title = "We're Logged in"
        let statusHeight = UIApplication.shared.statusBarFrame.height
        let navBarHeight = navigationController?.navigationBar.frame.size.height
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: statusHeight + navBarHeight!, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
