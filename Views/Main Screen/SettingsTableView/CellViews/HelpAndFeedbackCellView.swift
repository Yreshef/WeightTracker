//
//  HelpAndFeedbackCellView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class HelpAndFeedbackCellView: UITableViewCell {
    
    // MARK: - Components
    //=============================
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
        }
    }
    
    // MARK: - Life Cycle
    //=============================
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    //=============================
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    // MARK: - Methods
    //=============================
    
    private func setupView() {
        addSubview(nameLabel)
        setConstraints()
    }
    
    private func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    func setup(type: SectionType){
        textLabel?.text = type.description
        accessoryType = type.containsArrow ? .disclosureIndicator : .none
    }
}
