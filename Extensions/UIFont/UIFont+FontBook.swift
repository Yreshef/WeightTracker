//
//  UIFont+FontBook.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public enum FontBook: String {
    
    case robotoBlack = "Roboto-Black"
    case robotoBackItalic = "Roboto-BlackItalic"
    case robotoThin = "Roboto-Thin"
    case robotoLight = "Roboto-Light"
    
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
