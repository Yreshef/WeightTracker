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
    
    //TODO: Implement
    func getInDayWeekday() -> String?{
        return get(inFormat: "")
    }
    
    func get(_ components: Calendar.Component...,
        calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ componenet: Calendar.Component,
             calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(componenet, from: self)
    }
}
