//
//  TabBarVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import SOTabBar

class TabBarVC: UITabBarController, UITabBarControllerDelegate{
    
    // MARK: - Properties
    //=============================
    
    private let weightFacade: WeightFacadable
    private let environment: AppEnvironment
  
    // MARK: - Initializers
    //=============================
    
    public init(environment: AppEnvironment){
        weightFacade = environment.weightFacade
        self.environment = environment
        
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Disable Landsacpe
    //=============================
    
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
        
        let graphVC = GraphVC(environment: environment)
        let homeVC = HomeVC(environment: environment)
        let dailyInputVC = DailyEntryVC(environment: environment)
        let settingsVC = SettingsVC(environment: environment)
        
        homeVC.title = "Home"
        graphVC.title = "Graph"
        dailyInputVC.title = "Daily Input"
        settingsVC.title = "Settings"
        
        
        homeVC.tabBarItem.image = Constants.tabBarHomeImage
        graphVC.tabBarItem.image = Constants.tabBarGraphImage
        dailyInputVC.tabBarItem.image = Constants.tabBarDailyEntryImage
        settingsVC.tabBarItem.image = Constants.tabBarSettingsImage
        
        viewControllers = [homeVC,
                           graphVC,
                           dailyInputVC,
                           UINavigationController(rootViewController: settingsVC)]
    }
}

