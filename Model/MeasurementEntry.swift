//
//  MeasurementEntry.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 29/05/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation


struct MeasurementEntry {
    var weight: Float
    var date: Date
    
    public static let stub = MeasurementEntry(weight: 89, date: Date().addingTimeInterval(-10_000))
}
