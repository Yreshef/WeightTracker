//
//  OnboardingView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 22/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class OnboardingView: UIView {
    
    // MARK: - Components
    //=============================
    
    
    // MARK: - Life Cycle
    //=============================
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    //=============================
    
    
    
    
    // MARK: - Methods
    //=============================
}


/**
 A page control view with 3-4 views showing the user the features of the application, and suggesting a login/signup
 at the end.
 
 Alternatively, use page control to show the user the features AFTER he is logged in, and at the end ask for 1st time input
 of weight and goals.
 
 or just have both :D
 */
