//
//  HelpAndFeedbackSections.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

enum HelpAndFeedbackSections: Int, CaseIterable, CustomStringConvertible {
    
    case Help
    case Feedback
    case About
    
    var description: String {
        switch self {
        case .Help:
            return "Help"
        case .Feedback:
            return "Feedback"
        case .About:
            return "About"
        }
        
    }
}

enum HelpOptions: Int, CaseIterable, SectionType {
    var constainsSwitch: Bool {
        return false
    }
    
    var containsArrow: Bool {
        switch self {
        case .HelpCenter: return true
        }
    }
    
    
    case HelpCenter
    
    var description: String {
        switch self {
        case .HelpCenter:
            return "Help Center"
        }
    }
}

enum FeedbackOptions: Int, CaseIterable, SectionType {
    var constainsSwitch: Bool {
        return false
    }
    
    var containsArrow: Bool {
        switch self {
        case .GiveFeedback: return true
        case .ReportAProblem: return true
        case .SuggestAFeature: return true
        case .RateUs: return true
        }
    }
    
    
    case GiveFeedback
    case ReportAProblem
    case SuggestAFeature
    case RateUs
    
    var description: String {
        switch self {
        case .GiveFeedback: return "Give Feedback"
        case .ReportAProblem: return "Report A Problem"
        case .SuggestAFeature: return "Suggest A Feature"
        case .RateUs: return "Rate Us"
        }
    }
}

enum AboutOptions: Int, CaseIterable, SectionType {
    
    var constainsSwitch: Bool {
        return false
    }
    
    var containsArrow: Bool {
        switch self {
        case .ThirdPartyNotices: return true
        case .Privacy: return true
        case .TermsOfUse: return true
        }
    }
    
    
    case ThirdPartyNotices
    case Privacy
    case TermsOfUse
    
    var description: String {
        switch self {
        case .ThirdPartyNotices: return "Third Party Notices"
        case .Privacy: return "Privacy"
        case .TermsOfUse: return "Terms of Use"
        }
    }
}

