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
    
    private let bgColor: UIColor = UIColor(named: "yaleBlue") ?? .black
    
    private let emailImage: UIImage? = UIImage(named: "emailWhite")
    private let passwordImage: UIImage? = UIImage(named: "lockWhite")
    
    
    // MARK: - Life Cycle
    //=============================
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = bgColor
        
        addSubview(middleStackView)
        addSubview(forgotPasswordButton)
        addSubview(bottomStackView)
        setConstraints()
        setUIElements()
        setKeyboardType()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    public let emailTextField = WTUnderlineTextField()
    public let passwordTextField = WTUnderlineTextField()
    public let signInButton = WTButton()
    
    
    public lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an acccount yet? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
                
        return button
    }()
    
    //TODO: Remove the green color, testing purposes
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(named: "platinum") ?? UIColor.green, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.showsTouchWhenHighlighted = true
        return button
    }()
    
    //TODO: Ask dan to remind me whats the name of this property
    private lazy var middleStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailTextField,
                                                       self.passwordTextField,
                                                       self.signInButton])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.spacing = 30
        
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return stackview
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.signUpButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        
        return stackview
    }()

    // MARK: - Methods
    //=============================
    
    private func setConstraints() {
        
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        middleStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        middleStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        middleStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 10).isActive = true
        forgotPasswordButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
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
    
//    func addForgotPasswordButtonTarget(target: Any, action: Selector,
//                                       for event: UIControl.Event) {
//        forgotPasswordButton.addTarget(target, action: action, for: event)
//    }
    
    private func setKeyboardType() {
        emailTextField.textField.keyboardType = .emailAddress
        passwordTextField.textField.keyboardType = .numbersAndPunctuation
        
        // Mask password text
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    private func setUIElements() {
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        emailTextField.textField.leftView = UIImageView(image: emailImage)
        emailTextField.textField.leftViewMode = UITextField.ViewMode.always
        
        passwordTextField.textField.setAttributedText(placeholder: "Password")
        passwordTextField.textField.leftView = UIImageView(image: passwordImage)
        passwordTextField.textField.leftViewMode = UITextField.ViewMode.always
        
        signInButton.backgroundColor = .white
        signInButton.setTitle("Log In", for: .normal)
        signInButton.setTitleColor(UIColor(named: "yaleBlue"), for: .normal)
        
    }
}
