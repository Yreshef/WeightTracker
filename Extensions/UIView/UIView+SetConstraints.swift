//
//  UIView+SetConstraints.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor,
                leading: NSLayoutXAxisAnchor,
                bottom: NSLayoutYAxisAnchor,
                trailing: NSLayoutXAxisAnchor,
                padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top,
                             constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading,
                           constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom,
                                constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing,
                                  constant: -padding.right).isActive = true
    }
    
    func anchor(to: UIView, padding: UIEdgeInsets = .zero) {
        self.anchor(top: to.topAnchor, leading: to.leadingAnchor, bottom: to.bottomAnchor, trailing: to.trailingAnchor, padding: padding)
    }
    
}
