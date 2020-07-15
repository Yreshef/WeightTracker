//
//  HomeView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class HomeView: UIView {
    
    //TODO: Figure out what method i want to show the user's 1st time logging in
    
    // MARK: - Properties
    //=============================
    
    let circleDataView = CircleDataView()
    let startDataView = HomeDataView(title: "Start", weight: "0")
    let goalDataView = HomeDataView(title: "Goal", weight: "0")
    let homeBMIScaleView = HomeBMIScaleView()
    
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
    
    //TODO: Decide if i want to implement this
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
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.plusSignImage, for: .normal)
        button.backgroundColor = .white
        //TODO: Make the button round
        return button
    }()
    
    
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
        
        homeBMIScaleView.clipsToBounds = true
        homeBMIScaleView.layer.cornerRadius = 10
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func setupUI() {
        addSubview(mainStackView)
        addSubview(bmiStackView)
        addSubview(addButton)
        setConstraints()
    }
    
    //TODO: Review
    func populateUI(startingWeight: Float, goalWeight: Float, bmi: Float, progress: Int, currentWeight: Float) {
        startDataView.populateUI(weight: startingWeight)
        goalDataView.populateUI(weight: goalWeight)
        homeBMIScaleView.populateUI(bmi: bmi)
        circleDataView.populateUI(progress: progress, currentWeight: currentWeight)
    }
    
    func updateDailyProgress(progress: Int, currentWeight: Float) {
        circleDataView.populateUI(progress: progress, currentWeight: currentWeight)
    }
    
    func addNewEntryButtonTarget(target: Any, action: Selector,
                                 for event: UIControl.Event) {
        addButton.addTarget(target, action: action, for: event)
    }
}
