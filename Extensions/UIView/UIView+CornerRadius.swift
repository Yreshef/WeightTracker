//
//  UIView+CornerRadius.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func set(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
