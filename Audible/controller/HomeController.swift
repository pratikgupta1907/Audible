//
//  HomeController.swift
//  Audible
//
//  Created by pratik gupta on 11/11/19.
//  Copyright © 2019 pratik gupta. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "home"))
        view.addSubview(imageView)
        navigationItem.title = "We're Logged in"
        let statusHeight = UIApplication.shared.statusBarFrame.height
        let navBarHeight = navigationController?.navigationBar.frame.size.height
        _ = imageView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: statusHeight + navBarHeight!, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    @objc
    func handleSignOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        present(LoginViewController(), animated: true, completion: nil)
    }
}
