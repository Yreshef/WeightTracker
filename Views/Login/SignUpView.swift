//
//  SignUpView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class SignUpView: UIView {
    
    //TODO: FIX a bug where firebase is trying to access iCloud keychain
    // and fails, so a white rectangle pops for half a second and disappears
    
    // MARK: - Properties
    //=============================
    
    let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
    
    private let selectedUnderlineColor = UIColor(named: "paleSpringBud")
    private let deselectedUnderlineColor: UIColor = .white

    
    weak var delegate: UITextFieldDelegate? {
        didSet {
            nameTextField.textField.delegate = self.delegate
            emailTextField.textField.delegate = self.delegate
            passwordTextField.textField.delegate = self.delegate
        }
    }
    
    private var placeHolder = ""


    
    // MARK: - Initializers
    //=============================
    
    public init() {
        super.init(frame: .zero)
        setSubviewForAutoLayout(mainStackView)
        backgroundColor = bgColor
        
        setKeyboardType()
        setPlaceholders()
        setConstraints()
        submitButton.setTitle("Submit", for: .normal)
        
        nameTextField.textField.delegate = self
        emailTextField.textField.delegate = self
        passwordTextField.textField.delegate = self
        
        nameTextField.tag = TextFieldTag.nameTextField.rawValue
        emailTextField.tag = TextFieldTag.emailTextField.rawValue
        passwordTextField.tag = TextFieldTag.passwordTextField.rawValue
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    //=============================
    
    private func setKeyboardType() {
        nameTextField.textField.keyboardType = .alphabet
        emailTextField.textField.keyboardType = .emailAddress
        passwordTextField.textField.keyboardType = .numbersAndPunctuation
        
        // Mask password text
        passwordTextField.textField.isSecureTextEntry = true
    }
    
    private func setPlaceholders() {
        nameTextField.textField.setAttributedText(placeholder: "Name")
        emailTextField.textField.setAttributedText(placeholder: "Email")
        passwordTextField.textField.setAttributedText(placeholder: "Password")
    }
    
    private func setConstraints() {

        mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    


    
    // MARK: - Subviews
    //=============================
    
    private let nameTextField = WTUnderlineTextField()
    private let emailTextField = WTUnderlineTextField()
    private let passwordTextField = WTUnderlineTextField()
    
    private let submitButton: WTButton = {
        let button = WTButton()
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()


    private lazy var textFieldStackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.nameTextField,
                                                       self.emailTextField,
                                                       self.passwordTextField])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        stackView.arrangedSubviews.forEach {
            $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [])
        
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.alignment = .fill
        stackview.spacing = 10.0
        
        return stackview
    }()
    
    private lazy var mainStackView: UIStackView = { [unowned self] in
        let stackview = UIStackView(arrangedSubviews: [self.textFieldStackView,
                                                       self.submitButton])
        
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.alignment = .leading
        stackview.spacing = 10.0
        self.textFieldStackView.widthAnchor.constraint(equalTo: stackview.widthAnchor, multiplier: 1).isActive = true
        
        return stackview
    }()
}


// MARK: - UITextFieldDelegate
//=============================

extension SignUpView: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        placeHolder = textField.placeholder ?? ""
        textField.placeholder = ""
        guard let underlined = underlinedTextField(by: textField.tag) else {
            return
        }
        underlined.underlineColor = selectedUnderlineColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "" {
            textField.placeholder = placeHolder
        }
        guard let underlined = underlinedTextField(by: textField.tag) else {
            return
        }
        underlined.underlineColor = deselectedUnderlineColor
    }
    
    private func underlinedTextField(by tag: Int) -> WTUnderlineTextField?{
        return textFieldStackView.arrangedSubviews.filter {
            $0.tag == tag
        }.first as? WTUnderlineTextField
    }
}

private enum TextFieldTag: Int {
    
    case nameTextField = 1
    case surnameTextField = 2
    case emailTextField = 3
    case confirmEmailTextField = 4
    case passwordTextField = 5
    case confirmPasswordTextField = 6
    
}
