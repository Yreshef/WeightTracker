//
//  HomeDataView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 16/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public final class HomeDataView: UIView {
    
    // MARK: - Components
    //=============================
    
    
    // MARK: - Life Cycle
    //=============================
    
    init(title: String, weight: String) {
        super.init(frame: .zero)
        addSubview(stackView)
        setConstraints()
        stackView.backgroundColor = .white
        titleLabel.text = title
        weightLabel.text = weight
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    //=============================
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        
        label.backgroundColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.4
        label.layer.cornerRadius = 25

        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.titleLabel,
                                                       self.weightLabel])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.backgroundColor = .white
        stackview.spacing = 2
        
        
        return stackview
    }()
    
    
    
    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    public func populateUI(weight: Float) {
        //TODO: Implement
    }
}

