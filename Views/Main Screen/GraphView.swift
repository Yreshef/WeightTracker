//
//  GraphView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Charts

public class GraphView: UIView{
    
    // MARK: - Properties
    //=============================
        
    let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
    let label = UILabel()

    //TODO: Add a graph view
    
    //TODO: Add 2 variables to represent the date the data was saved and
    //      the number of KG/Lbs for the given date.
    
    
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(frame: .zero)
        backgroundColor = bgColor
        addSubview(label)
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 35)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Subviews
    //=============================
    
    //TODO: Add constraints for the subviews
    
    
    
    
    // MARK: - Setters
    //=============================


}
