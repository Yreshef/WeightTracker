//
//  MeasurementUnitCellView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 04/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class MeasurementUnitCellView: UITableViewCell {
    
    // MARK: - Initializers
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
    
    let measurementUnitLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.measurementUnitLabel])
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.distribution = .fill
        
                
        return stackview
    }()
    
    
    // MARK: - Methods
    //=============================
    
    private func setupView() {
        addSubview(cellStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        cellStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    //TODO: Ask Dan about this implementation
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
    
}
