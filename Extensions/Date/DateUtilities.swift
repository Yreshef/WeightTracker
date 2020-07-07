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
    
    ///TODO: Clean up the code a bit once UI is set
    var readableRepresentation: String {
        let dayFormatter = DateFormatter()
        let weekdayFormatter = DateFormatter()
        
        dayFormatter.dateFormat = "d"
        weekdayFormatter.dateFormat = "E"
        
        let day = dayFormatter.string(from: self)
        let weekday = weekdayFormatter.string(from: self)

        
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .ordinal
        let dayOrdinal = numFormatter.string(from: NSNumber(value: Int(day) ?? 10)) ?? ""
        
        return """
        \(dayOrdinal)
        \(weekday)
        """
    }
}
