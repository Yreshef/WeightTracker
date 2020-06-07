//
//  UIView+SetSubviewsForAutoLayout.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import UIKit

/**
 Add one or multiple subviews to your view.
 */

public extension UIView {
    func setSubviewForAutoLayout(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }
    
    func setSubviewForAutoLayout(_ subviews: [UIView]) {
        subviews.forEach(self.setSubviewForAutoLayout)
    }
}
