//
//  MeasurementUnitCellView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 04/07/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class MeasurementUnitCellView: UITableViewCell {
    
    // MARK: - Components
    //=============================
    
    private let checkmarkImage = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))
    
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
    
    let measurementUnitLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(self.checkmarkImage, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        return button
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.measurementUnitLabel,
                                                       self.checkmarkButton])
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
    
}
