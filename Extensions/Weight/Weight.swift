//
//  Weight.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 29/05/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

///Weight in Kg
typealias Weight = Float

extension Weight {
    var inLbs: Weight{
        return self * 2.205
    }
}
