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
    
    private let bgColor: UIColor = UIColor(named: "yaleBlue") ?? .black
    
    private let emailImage: UIImage? = UIImage(named: "emailWhite")
    private let passwordImage: UIImage? = UIImage(named: "lockWhite")
    private let userImage: UIImage? = UIImage(named: "userWhite")
    
    // MARK: - Life Cycle
    //=============================
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = bgColor
        
        addSubview(middleStackView)
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
    public let usernameTextField = WTUnderlineTextField()
    public let passwordTextField = WTUnderlineTextField()
    
    private let signUpButton = WTButton()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    private lazy var middleStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailTextField,
                                                       self.usernameTextField,
                                                       self.passwordTextField,
                                                       self.signUpButton])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.spacing = 30
        
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        return stackview
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.signInButton])
        
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
        
        
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    private func setKeyboardType() {
        emailTextField.textField.keyboardType = .emailAddress
        usernameTextField.textField.keyboardType = .alphabet
        passwordTextField.textField.keyboardType = .numbersAndPunctuation
        
        // Mask password text
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    
    private func setUIElements() {
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        emailTextField.textField.leftView = UIImageView(image: emailImage)
        emailTextField.textField.leftViewMode = UITextField.ViewMode.always
        
        usernameTextField.textField.setAttributedText(placeholder: "Username")
        usernameTextField.textField.leftView = UIImageView(image: userImage)
        usernameTextField.textField.leftViewMode = UITextField.ViewMode.always
        
        
        passwordTextField.textField.setAttributedText(placeholder: "Password")
        passwordTextField.textField.leftView = UIImageView(image: passwordImage)
        passwordTextField.textField.leftViewMode = UITextField.ViewMode.always
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(UIColor(named: "yaleBlue"), for: .normal)
        signUpButton.backgroundColor = .white
        
    }
    
    public func addSignUpButtonTarget(target: Any,
                                      action: Selector,
                                      for event: UIControl.Event){
        signUpButton.addTarget(target, action: action, for: event)
    }
    
    public func addSignInButtonTarget(target: Any,
                                      action: Selector,
                                      for event: UIControl.Event) {
        signInButton.addTarget(target, action: action, for: event)
    }
}


extension SignUpScreenView: UITextFieldDelegate {
    
    //TODO: Implement this
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
