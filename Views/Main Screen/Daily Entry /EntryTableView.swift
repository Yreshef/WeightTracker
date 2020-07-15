//
//  EntryTableView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class EntryTableView: UITableView {
    
    // MARK: - Initializers
    //=============================
    init() {
        super.init(frame: .zero, style: .plain)
        setupUI()
        self.backgroundColor = .clear
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
    
    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        tableView.anchor(to: self)
    }
    
    private func setupUI() {
        addSubview(tableView)
        setConstraints()
    }
}
