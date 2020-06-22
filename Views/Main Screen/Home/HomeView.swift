//
//  HomeView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class HomeView: UIView {
    
    // MARK: - Properties
    //=============================
    //TODO: Implement 4 views to display data to the user.
    
    //TODO: Add a new user landing page to set up the ui before showing the
    //      home screen for the 1st time
    
    let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
    
    let circleDataView: UIView = CircleDataView()
    let startDataView: UIView = HomeDataView(title: "Start", weight: "0")
    let goalDataView: UIView = HomeDataView(title: "Goal", weight: "0")
    
    let homeBMIScaleView: UIView = HomeBMIScaleView()
    
    
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(frame: .zero)
        backgroundColor = bgColor
        addSubview(mainStackView)
        addSubview(bmiStackView)
        setConstraints()
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Subviews
    //=============================
    
    private lazy var labelStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.startDataView,
                                                       self.goalDataView])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.spacing = 20
        
        self.startDataView.backgroundColor = .white
        self.goalDataView.backgroundColor = .white
        self.goalDataView.translatesAutoresizingMaskIntoConstraints = false
        self.startDataView.translatesAutoresizingMaskIntoConstraints = false

        
        return stackview
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.circleDataView,
                                                       self.labelStackView])
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.spacing = 20
        
        self.circleDataView.backgroundColor = .white
        self.circleDataView.widthAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 0.7).isActive = true
    
        return stackview
    }()
    
    private lazy var bmiStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [homeBMIScaleView])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        
        return stackview
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-Light", size: 20) ?? UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Roboto", size: 30) ?? UIFont.systemFont(ofSize: 60)
        
        return label
    }()
    
    let addButton = UIButton()
    
    
    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
         mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
         mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 0.6).isActive = true
        
        circleDataView.clipsToBounds = true
        circleDataView.layer.cornerRadius = 10
        
        startDataView.clipsToBounds = true
        startDataView.layer.cornerRadius = 10
        
        goalDataView.clipsToBounds = true
        goalDataView.layer.cornerRadius = 10
        
        bmiStackView.translatesAutoresizingMaskIntoConstraints = false
        bmiStackView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 145).isActive = true
        bmiStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bmiStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bmiStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    //TODO: Ask dan why can't i call functions from the other views
    private func populateUI(bmi: Float) {
    }
}
