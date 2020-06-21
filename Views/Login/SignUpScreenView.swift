//
//  SignUpScreenView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 13/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public final class SignUpScreenView: UIView {
    
    // MARK: - Components
    //=============================
    
    private let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
    private let continueImage: UIImage? = UIImage(named: "ContinueButton")
    
    
    // MARK: - Life Cycle
    //=============================
    
    public init() {
        super.init(frame: .zero)
        addSubview(titleStackView)
        backgroundColor = bgColor
        addSubview(textFieldStackView)
        addSubview(signUpStackView)
        addSubview(backButton)
        setConstraints()
        setUIElements()
        setKeyboardType()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    private let title = WTTitle()
    public let emailTextField = WTUnderlineTextField()
    public let usernameTextField = WTUnderlineTextField()
    public let passwordTextField = WTUnderlineTextField()
    private let signUpLabel = UILabel()
    
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        return button
    }()
    
    private let backButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Back", for: .normal)
        button.underlineText()
        button.titleLabel?.textColor = .white
        
        return button
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.title])
        
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillEqually
        stackview.spacing = 0
        
        return stackview
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailTextField,
                                                       self.usernameTextField,
                                                       self.passwordTextField])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.spacing = 30
        
        return stackview
    }()
    
    private lazy var signUpStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.signUpLabel,
                                                       self.signUpButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        return stackview
    }()
    
    private lazy var bottomButtonsStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.backButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        
        return stackview
    }()
    
    
    // MARK: - Methods
    //=============================
    
    
    private func setConstraints() {
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textFieldStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textFieldStackView.bottomAnchor.constraint(equalTo: signUpStackView.topAnchor, constant: -36).isActive = true
        
        
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        signUpStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        signUpStackView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -150).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
    }
    
    private func setKeyboardType() {
        emailTextField.textField.keyboardType = .emailAddress
        usernameTextField.textField.keyboardType = .alphabet
        passwordTextField.textField.keyboardType = .numbersAndPunctuation
        
        // Mask password text
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    
    private func setUIElements() {
        
        title.text = "Create\nAccount"
        title.numberOfLines = 2
        title.lineBreakMode = .byWordWrapping
        title.textColor = .white
        title.font = UIFont(name: "Roboto-Bold", size: 45)
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        usernameTextField.textField.setAttributedText(placeholder: "Username")
        passwordTextField.textField.setAttributedText(placeholder: "Password")
        
        signUpLabel.text = "Sign up"
        signUpLabel.textColor = .white
        signUpLabel.font = UIFont(name: "Roboto-Bold", size: 30)
        
        signUpButton.setImage(continueImage, for: .normal)
    }
    
    func addSignUpButtonTarget(target: Any,
                               action: Selector,
                               for event: UIControl.Event){
        signUpButton.addTarget(target, action: action, for: event)
        
    }
}


extension SignUpScreenView: UITextFieldDelegate {
    
    //TODO: Implement this
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
