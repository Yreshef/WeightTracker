//
//  TabBarVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate{
    
    // MARK: - Properties
    //=============================
    
    let homeImage = UIImage(named: "homeIcon")
    
    // MARK: - Initializers
    //=============================
    
    
    //Disable landscape
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        UINavigationBar.appearance().prefersLargeTitles = true
        setupTabBar()
    }

    // MARK: - Methods
    //=============================

    private func setupTabBar() {
        let add = generateNC(vc: ViewController(), title: "Add")
//        let addButton = UIButton()
        let graphVC = GraphVC()
        let homeVC = HomeVC()
        let dailyInputVC = DailyInputVC()
        let settingsVC = SettingsVC()
        let homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.title = "Home"
        graphVC.title = "Graph"
        dailyInputVC.title = "Daily Input"
        settingsVC.title = "Settings"
        viewControllers = [homeNavController, graphVC, add, dailyInputVC, settingsVC]
    }
    
    private func setTabBarItems() {
        
    }
    
    private func generateNC(vc: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }

}
