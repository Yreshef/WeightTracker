//
//  Constants.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 03/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public struct Constants {
    
    // MARK: - Background Color
    //=============================
    static let backgroundColor = UIColor(named: "yaleBlue")
    
    // MARK: - Images
    //=============================
    static let emailImage = UIImage(named: "emailWhite")
    static let passwordImage = UIImage(named: "passwordWhite")
    static let userImage = UIImage(named: "userWhite")
    
    static let checkmarkImage = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    static let plusSignImage = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(UIColor(red: 15 / 255, green: 77 / 255, blue: 146 / 255, alpha: 1), renderingMode: .alwaysOriginal)
    
    static let tabBarHomeImage = UIImage(named: "home")
    static let tabBarGraphImage = UIImage(named: "graph")
    static let tabBarDailyEntryImage = UIImage(named: "list")
    static let tabBarSettingsImage = UIImage(named: "settings")

    // MARK: - Properties
    //=============================
    static let tableViewRowHeight: CGFloat = 50
    static let headerHeight: CGFloat = 40

}

extension Notification.Name {
    static let MeasurementDidChange = Notification.Name("MeasurementDidChange")
    static let UserLoggedIn = Notification.Name("UserLoggedIn")
    static let UserLoggedOut = Notification.Name("UserLoggedOut")
}
