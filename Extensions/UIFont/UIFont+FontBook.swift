//
//  UIFont+FontBook.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public enum FontBook: String {
     case Black = "Roboto-Black"
     case BackItalic = "Roboto-BlackItalic"
     
     
     func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
     }
 }
