//
//  HomeVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public final class HomeVC: UIViewController {
    
    // MARK: - Properties
    //=============================
//    private let weightFacade: WeightFacadable
//    private let databaseFacade: DatabaseFacadable
//    private let environment: AppEnvironment

    private let homeView: UIView = HomeView()
    
    // MARK: - Initializers
    //=============================
    
    init() {
//        weightFacade = environment.weightFacade
//        databaseFacade = environment.databaseFacade
//        self.environment = environment
        
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Methods
    //=============================
    
    private func fetchStartGoal() -> Float{
        //TODO: Implement
        
        //Take the user's 1st input for his starting weight (?)and the date at which the
        //the input was given(?)
        
        return 0.0
    }
    
    private func fetchEndGoal() -> Float{
        //TODO: implement
        
        //Take the user's 1st input for his end weight goal
        
        return 0.0
    }
    
    private func calculatePrecentage() -> Float{
        //TODO: implement
        
        //calculate the precentage of the way the user has gone to achieve her goal
        
        return 0.0
    }
    
    private func setBMIScale() -> Float {
        //TODO: implement
        
        //calculate the user's BMI by today's updated measures
        
        return 0.0
    }
    
    //TODO: Ask dan how to access the properties of the subviwe's subview
    private func populateUI(startingWeigh: Float, goalWeight: Float, progress: Float, bmi: Float) {
        //TODO: implement
        
        //receive the input from the other functions and populate the appropriate
        //ui elements
        
        
    }

}
