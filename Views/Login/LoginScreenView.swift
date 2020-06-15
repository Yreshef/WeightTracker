//
//  LoginScreenView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 13/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public final class LoginScreenView: UIView {
    
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
        addSubview(signInStackView)
        addSubview(bottomButtonsStackView)
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
    private let emailTextField = WTUnderlineTextField()
    private let passwordTextField = WTUnderlineTextField()
    private let signInLabel = UILabel()
    private let signInButton: UIButton = {
        let button = UIButton()
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        return button
    }()
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.underlineText()
        button.titleLabel?.textColor = .white
        return button
    }()
    private let forgotPasswordButton = UIButton()
    
    
    private lazy var titleStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.title])
        
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillEqually
        stackview.spacing = 0
        
        return stackview
    }()
    
  private lazy var textFieldStackView: UIStackView = { [unowned self] in
    let stackview = UIStackView(arrangedSubviews: [self.emailTextField,
                                                   self.passwordTextField])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.spacing = 30
        
        return stackview
    }()
    
    private lazy var signInStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.signInLabel,
                                                       self.signInButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        return stackview
        }()
    
    private lazy var bottomButtonsStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.signUpButton,
                                                       self.forgotPasswordButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
          
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
        textFieldStackView.bottomAnchor.constraint(equalTo: signInStackView.topAnchor, constant: -36).isActive = true
        
        signInStackView.translatesAutoresizingMaskIntoConstraints = false
        signInStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        signInStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        signInStackView.bottomAnchor.constraint(equalTo: bottomButtonsStackView.topAnchor, constant: -150).isActive = true
        
        bottomButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        bottomButtonsStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bottomButtonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
        
    }
    
    func addSignUpButtonTarget(target: Any,
                                  action: Selector,
                                  for event: UIControl.Event) {
        signUpButton.addTarget(target, action: action, for: event)
    }
    
    func addLoginButtonTarget(target: Any, action: Selector,
                              for event: UIControl.Event){
        signInButton.addTarget(target, action: action, for: event)
    }
    
    func addForgotPasswordButtonTarget(target: Any, action: Selector,
                                       for event: UIControl.Event) {
        forgotPasswordButton.addTarget(target, action: action, for: event)
    }
    
    private func setKeyboardType() {
        emailTextField.textField.keyboardType = .emailAddress
        passwordTextField.textField.keyboardType = .numbersAndPunctuation
        
        // Mask password text
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    private func setUIElements() {
        title.text = "Welcome"
        title.textColor = .white
        title.font = UIFont(name: "Roboto-Bold", size: 40)
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        passwordTextField.textField.setAttributedText(placeholder: "Password")
        
        signInLabel.text = "Sign In"
        signInLabel.textColor = .white
        signInLabel.font = UIFont(name: "Roboto-Bold", size: 30)
        
        signInButton.setImage(continueImage, for: .normal)

        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.textColor = .white
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.underlineText()
        forgotPasswordButton.titleLabel?.textColor = .white
    }
}
