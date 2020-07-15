//
//  HelpAndFeedbackView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class HelpAndFeedbackView: UIView {
    
    // MARK: - Properties
    //=============================
    
    let tableView = HelpAndFeedbackTableView()
    
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Constants.backgroundColor
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true

    }
    
    private func setupUI() {
        addSubview(tableView)
        setConstraints()
    }
}
