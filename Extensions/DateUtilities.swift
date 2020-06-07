//
//  DateUtilities.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 29/05/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

extension Date {
    func get(inFormat format: String) -> String?{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func getInEuropeanDateFormat() -> String?{
        return get(inFormat: "dd.MM.yyyy")
    }
}
