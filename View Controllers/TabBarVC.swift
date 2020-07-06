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
    private let databaseFacade: DatabaseFacadable
    private let environment: AppEnvironment
    
    let homeImage = UIImage(named: "home")
    let graphImage = UIImage(named: "graph")
    let addImage = UIImage(named: "add")
    let dailyListImage = UIImage(named: "list")
    let settingsImage = UIImage(named: "settings")

    
    private let tabBarView = TabBarView()

    // MARK: - Initializers
    //=============================
    
    public init(environment: AppEnvironment){
        weightFacade = environment.weightFacade
        databaseFacade = environment.databaseFacade
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
        
        let add = UIViewController()
        let graphVC = GraphVC(environment: environment)
        let homeVC = HomeVC(environment: environment)
        let dailyInputVC = DailyEntryVC(environment: environment)
        let settingsVC = SettingsVC(environment: environment)
        add.title = "Add"
        homeVC.title = "Home"
        graphVC.title = "Graph"
        dailyInputVC.title = "Daily Input"
        settingsVC.title = "Settings"
        add.tabBarItem.image = addImage
        homeVC.tabBarItem.image = homeImage
        graphVC.tabBarItem.image = graphImage
        dailyInputVC.tabBarItem.image = dailyListImage
        settingsVC.tabBarItem.image = settingsImage
        
        add.view.tag = 14296
        viewControllers = [homeVC,
                           graphVC,
                           add,
                           dailyInputVC,
                           UINavigationController(rootViewController: settingsVC)]
    }
    
    private func setTabBarItems() {
        
    }
    
    
    private func addButtonTarget() {
        
    }
    
    private func generateNC(vc: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }
    
    private func setupMiddleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25,
                                                   y: -20, width: 50, height: 50))
        //Style the button here
        
        //add to tab bar
        self.tabBar.addSubview(middleButton)
//        middleButton.addTarget(self, action: #selector(), for: <#T##UIControl.Event#>)
        
        self.view.layoutIfNeeded()
    }
    
    private func addButtonTapped() {
        let ac = UIAlertController(title: "Add Measurement", message: "Input your weight and tap OK", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            print(ac.textFields?.first?.text)
        }
        ac.addTextField { (textfield) in
            textfield.placeholder = "Weight"
        }
        ac.addAction(addAction)
        ac.addAction(cancelAction)
        self.present(ac, animated: true, completion: nil)
    }
    
}

extension TabBarVC {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.view.tag == 14296 {
            print("LAMA KAHA HAZAK!?#")
            addButtonTapped()
            return false
        }
        return true
    }
}

/**
 Add bar color, maybe some bigger icons, change the bar style to curve down in the middle with a floating add button
 Add button funcitonality
 Add animations for transitioning views(?)
 */
