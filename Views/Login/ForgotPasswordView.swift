//
//  ForgotPasswordView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class ForgotPasswordView: UIView {
    
    // MARK: - Components
    //=============================
    private let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
    private let continueImage: UIImage? = UIImage(named: "ContinueButton")


    
    // MARK: - Life Cycle
    //=============================
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = bgColor
        
        addSubview(titleStackView)
        addSubview(textFieldStackView)
        addSubview(restoreStackView)
        addSubview(backButton)
        
        setConstraint()
        setUIElements()
        setKeyboardType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    private let title = UILabel()
    private let infoLabel = UILabel()
    private let emailTextField = WTUnderlineTextField()
    private let restoreLabel = UILabel()
    private let restoreButton = UIButton()
    private let backButton = UIButton()
    
    private lazy var titleStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.title])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        
        return stackview
    }()
    
    private lazy var textFieldStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.infoLabel,
                                                       self.emailTextField])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        
        return stackview
    }()
    
    private lazy var restoreStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.restoreLabel,
                                                       self.restoreButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        
        return stackview
    }()
    
    
    
    // MARK: - Methods
    //=============================
    
    private func setConstraint() {
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true


        
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textFieldStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textFieldStackView.bottomAnchor.constraint(equalTo: restoreStackView.topAnchor, constant: -36).isActive = true


        
        restoreStackView.translatesAutoresizingMaskIntoConstraints = false
        restoreStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        restoreStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        restoreStackView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -150).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
    }
    
    func addBackButtonTarget(target: Any,
                                    action: Selector,
                                    for event: UIControl.Event) {
          backButton.addTarget(target, action: action, for: event)
      }
    
    private func setKeyboardType() {
         emailTextField.textField.keyboardType = .emailAddress
    }
    
    private func setUIElements() {
        title.text = "Trouble\nlogging\nin?"
        title.numberOfLines = 3
        title.lineBreakMode = .byWordWrapping
        title.textColor = .white
        title.font = UIFont(name: "Roboto-Bold", size: 45)
        
        infoLabel.text = """
        Don't worry, it happens to the best of us.
        Please enter you email and we'll get on fixin it right away!
        """
        infoLabel.textColor = .white
        infoLabel.font = UIFont(name: "Roboto-Bold", size: 20) ?? UIFont.systemFont(ofSize: 50)
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = .byWordWrapping
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        
        restoreLabel.text = "Restore"
        restoreLabel.textColor = .white
        restoreLabel.font = UIFont(name: "Roboto-Bold", size: 30) ?? UIFont.systemFont(ofSize: 40)
        
        restoreButton.setImage(continueImage, for: .normal)
        
        backButton.setTitle("Back", for: .normal)
        backButton.underlineText()
        backButton.titleLabel?.textColor = .white
        
    }
}
