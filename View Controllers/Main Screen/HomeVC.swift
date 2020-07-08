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
    private let weightFacade: WeightFacadable
    private let environment: AppEnvironment

    private let homeView = HomeView()
    
    // MARK: - Initializers
    //=============================
    
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
        self.environment = environment

        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.bottomAnchor,
                        trailing: view.trailingAnchor)
        addButtonTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
//            self.addNewEntryButtonTapped()
//        })
    }
    
    // MARK: - Disable Landsacpe
    //=============================

    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - Methods
    //=============================
    
    //TODO: Check my math
    private func calculateBMI(height: Int, currentWeight: Float) -> Float {
        let meters = Float(height / 100)
        return currentWeight / (pow(meters, 2))
    }
    
    private func calculateProgress(startingWeight: Float,
                                   currentWeight: Float,
                                   goalWeight: Float) -> Int {
        let difference = startingWeight - currentWeight
        let amountOfKGToLose = startingWeight - goalWeight
        let percentage = (difference * 100) / amountOfKGToLose
        return Int(roundf(percentage))
    }
    
    @objc private func addNewEntryButtonTapped() {
        //TODO: Implement
        //Get a new weight and date entry from the user
        
        //Store the new entry in the database
        weightFacade.measure(weight: (Float.random(in: 50...150)))
        //refresh the ui to display the new user's data
        populateUI(startingWeight: 100, goalWeight: 75, height: 183, currentWeight: 87)
    }
    
    private func populateUI(startingWeight: Float, goalWeight: Float,
                            height: Int, currentWeight: Float) {
        let bmi = calculateBMI(height: height, currentWeight: currentWeight)
        let progress = calculateProgress(startingWeight: startingWeight,
                                         currentWeight: currentWeight,
                                         goalWeight: goalWeight)
        homeView.populateUI(startingWeight: startingWeight, goalWeight: goalWeight,
                            bmi: bmi, progress: progress, currentWeight: currentWeight)
    }
    
    private func addButtonTarget() {
        homeView.addNewEntryButtonTarget(target: self,
                                         action: #selector(addNewEntryButtonTapped),
                                         for: .touchUpInside)
    }
    
    private func refreshUI() {
        //TODO: Implement(?)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}



/**
 when a user logs in for the 1st time you ask him for his current weight. that weight will be as is for the reminder of the
 app's lifetime. after that you need to populate the UI with the data, changing only his current weight and calculating the
 progress with regards to his starting compared to his current weight.
 
 all this means that i cant show the "empty" app screen before making a 1st login page so the user can update the information
 so there is something to populate the screen.
 
 BMI scale will be updated relatively to the user's current weight.
 the circle will be animated every time the app launches, and updated every time the user inputs new information to the
 database. meaning that i need to refresh the ui after adding new information.
 
 starting/end goal label - updated for the 1st time when the user inputs the data, add a way to edit the info, but it doesn't need
 to be updated every single time. (Does it even matter?)
 
 bmi scale - updated on a daily basis
 
 progress bar - updated on a daily basis
 */
