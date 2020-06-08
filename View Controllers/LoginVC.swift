//
//  LoginVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import UIKit


public final class LoginVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let loginView: LoginView = LoginView()
    
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    
    
    let person = Person(weight: 80.0, userName: "Yohai")
    
    
    // MARK: - Initializers
    //=============================
    
    init(environment: AppEnvironment) {
        
        self.weightFacade = environment.weightFacade
        self.databaseFacade = environment.databaseFacade
        
        super.init(nibName: nil, bundle: nil)
        view.addSubview(loginView)
        loginView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try databaseFacade.create(person: person)
        } catch let error as NSError {
            print("Fetch error: \(error), Description: \(error.userInfo)")
        }
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    //=============================
    

    
    
    private func addActionToButton() {
        
    }
    
    @objc private func loginButtonPressed() {
        
    }
    
    @objc private func forgotPasswordPressed() {
        
    }
    
    
    //TODO: Add a button for the login option
    
    //TODO: Add a textfield for user login info and password
    
    //TODO: Add forgot password button
    
    //TODO: See if some of the features exist in Firebase already
    
    
}
