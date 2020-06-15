//
//  TabBarVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    // MARK: - Properties
    //=============================
    
    let homeImage = UIImage(named: "homeIcon")
    
    
    
    // MARK: - Initializers
    //=============================
    
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().prefersLargeTitles = true
        setupTabBar()
    }

    // MARK: - Methods
    //=============================

    private func setupTabBar() {
        let settings = generateNC(vc: ViewController(), title: "settings")
        let details = generateNC(vc: ViewController(), title: "details")
        let add = generateNC(vc: ViewController(), title: "add")
        let daily = generateNC(vc: ViewController(), title: "daily")
        let homeVC = HomeVC()
        let homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.title = "Home"
        viewControllers = [homeNavController, details, add, daily, settings]
    }
    
    private func setTabBarItems() {
        
    }
    
    private func generateNC(vc: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }

}
