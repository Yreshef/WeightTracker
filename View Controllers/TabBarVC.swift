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
    
    let homeImage = UIImage(named: "home")
    let graphImage = UIImage(named: "graph")
    let dailyListImage = UIImage(named: "list")
    let settingsImage = UIImage(named: "settings")

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
        let graphVC = GraphVC()
        let homeVC = HomeVC()
        let dailyInputVC = DailyInputVC()
        let settingsVC = SettingsVC()
        let homeNavController = UINavigationController(rootViewController: homeVC)
        
        homeNavController.title = "Home"
        graphVC.title = "Graph"
        dailyInputVC.title = "Daily Input"
        settingsVC.title = "Settings"
        homeNavController.tabBarItem.image = homeImage
        graphVC.tabBarItem.image = graphImage
        dailyInputVC.tabBarItem.image = dailyListImage
        settingsVC.tabBarItem.image = settingsImage
        
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
