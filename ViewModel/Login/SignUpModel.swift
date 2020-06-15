//
//  SignUpModel.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation


class SignUpModel: SignUpModelable {
    
    @objc private func submitButtonTapped(vc: ViewController) {
        
    }
    
    
    // MARK: - Methods
    //=============================

    private func validateRepeatInput(userInput: String, userInputConfirmation: String) -> Bool {
        if userInput == userInputConfirmation {
            return true
        }
        
        return false
    }
}


protocol SignUpModelable {
    
}
