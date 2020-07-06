//
//  EntryCellView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 17/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class EntryCellView: UITableViewCell {
    
    // MARK: - Components
    //=============================
    
    
    // MARK: - Life Cycle
    //=============================
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    let dateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "18 Sun"
        label.numberOfLines = 2
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        label.textAlignment = .center
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "90 KG"
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return label
    }()
    
    //TODO: Implement - or not
    let noteTextfield: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    
//    private lazy var cellStackView: UIStackView = {
//        let stackview = UIStackView(arrangedSubviews: [self.dateView,
//                                                       self.weightLabel])
//        stackview.axis = .horizontal
//        stackview.alignment = .leading
//        stackview.distribution = .equalSpacing
//        stackview.spacing = 0
//
//        return stackview
//    }()
    
    
    // MARK: - Methods
    //=============================
    
    private func setupView() {
        addSubview(dateView)
        addSubview(weightLabel)
        setConstraints()
    }
    
    private func setConstraints() {
//        cellStackView.translatesAutoresizingMaskIntoConstraints = false
//        cellStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        cellStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
//        cellStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dateView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.leadingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: 10).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        weightLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dateView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.anchor(to: dateView)
        dateLabel.backgroundColor = .systemTeal
    }
}




