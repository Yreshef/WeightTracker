//
//  EntryTableView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class EntryTableView: UITableView {
    
    // MARK: - Components
    //=============================
    
    
    // MARK: - Life Cycle
    //=============================
    init() {
        super.init(frame: .zero, style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    let tableView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    
    
    // MARK: - Setters
    //=============================
}
