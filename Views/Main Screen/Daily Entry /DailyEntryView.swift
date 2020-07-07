//
//  DailyEntryView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class DailyEntryView: UIView {
    
    // MARK: - Properties
    //=============================
    
    let tableView = EntryTableView()
    
    
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Constants.backgroundColor
        setupUI()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Subviews
    //=============================
    
    
    
    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
    }
    
    private func setupUI() {
        addSubview(tableView)
        setConstraints()
    }
}
