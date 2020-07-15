//
//  WTNavBar.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import UIKit


class WTNavBar: UINavigationBar {
    
    // MARK: - Components
    //=============================
    
    let usernameTextView = UITextView()
    let dateTextView = UITextView()
    
    let barHeight: CGFloat = 34
    let barWidth: CGFloat = 34
    let username = ""
    let date: String = Date().getInEuropeanDateFormat() ?? "Date error"
    let userImageView = UIImageView(image: #imageLiteral(resourceName: "placeholderUserImage"))
    
    // MARK: - Life Cycle
    //=============================
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.frame = CGRect(x: 0, y: 0, width: barWidth, height: barHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    //=============================

    private func setupNavigationBarItems() {
        usernameTextView.text = "Yohai"
        dateTextView.text = "Date: \(Date().getInEuropeanDateFormat() ?? "N/A")"
    }
}
