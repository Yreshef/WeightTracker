//
//  UIView+Keyboard.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public enum KeyboardType {
    case email, password, numbers, phonenumber, normal
}


public extension UITextField {
    
    func setUpKeyboard(_ type: KeyboardType, returnKeyType: UIReturnKeyType) {
        self.autocapitalizationType = UITextAutocapitalizationType.none
        self.autocorrectionType = UITextAutocorrectionType.no
        self.spellCheckingType = UITextSpellCheckingType.no
        self.keyboardAppearance = UIKeyboardAppearance.default
        self.returnKeyType = returnKeyType
        self.clearButtonMode = UITextField.ViewMode.always
        
        switch type {
        case .email:
            self.keyboardType = UIKeyboardType.emailAddress
            
        case .password:
            self.keyboardType = UIKeyboardType.default
            
        case .numbers:
            self.keyboardType = UIKeyboardType.numbersAndPunctuation
            
        case .phonenumber:
            self.keyboardType = UIKeyboardType.phonePad
            
        case .normal:
            self.keyboardType = UIKeyboardType.default
        }
    }
    
    func dismissKeyboardOnTap() {
        resignFirstResponder()
    }
    
    func dismissKeyboardOnSwipe() {
        
    }
}
