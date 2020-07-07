//
//  SettingsSections.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 25/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

protocol SectionType: CustomStringConvertible{
    var constainsSwitch: Bool { get }
    var containsArrow: Bool { get }
}



enum SettingsSections: Int, CaseIterable, CustomStringConvertible {
    
    case General
    case Profile
    
    var description: String {
        switch self {
        case .General:
            return "General"
        case .Profile:
            return "User Profile"
        }
    }
}



enum GeneralOptions: Int, CaseIterable, SectionType {
   
    var containsArrow: Bool {
        switch self {
        case .measurementUnit: return true
        case .notifications: return false
        case .helpAndFeedback: return true
        }
    }
    
    
    var constainsSwitch: Bool {
        switch self {
        case .measurementUnit: return false
        case .notifications: return true
        case .helpAndFeedback: return false
        }
    }
    
    case measurementUnit
    case notifications
    case helpAndFeedback
    
    var description: String {
        switch self {
        case .measurementUnit: return "Measurement Unit"
        case .notifications: return "Notifications"
        case .helpAndFeedback: return "Help & Feedback"
        }
    }
}

enum ProfileOptions: Int, CaseIterable, SectionType {
    
    var containsArrow: Bool {
        return self != .logout
    }
    
    
    var constainsSwitch: Bool {
        return false
    }
    
    case editProfile
    case logout
    
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .logout: return "Logout"
        }
    }
}
