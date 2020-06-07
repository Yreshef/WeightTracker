//
//  LoginView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


public final class LoginView: UIView {
    
    
    // MARK: - Text Enum
    //=============================

    private enum Text: String {
        case email, password
        case login = "Log In"
    }
    
    
    // MARK: - Initializers
    //=============================

    public init() {
        super.init(frame: .zero)
        self.setSubviewForAutoLayout(self.stackView)
        self.backgroundColor = UIColor.darkGray
        self.stackView.snp.makeConstraints { (make: ConstraintMaker)-> Void in
            make.center.equalToSuperview() 
            make.leading.equalToSuperview().offset(40.0)
            make.trailing.equalToSuperview().inset(40.0)
        }
        
        self.emailTextField.snp.makeConstraints({ [unowned self] (make: ConstraintMaker) -> Void in
            make.height.equalTo(self).multipliedBy(0.075)
            
        })
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================

    public let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.email.rawValue.capitalized
        textField.font = UIFont(name: "Roboto-Bold", size: 17)
        textField.textColor = UIColor.black
        textField.minimumFontSize = 17.0
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.setUpKeyboard(KeyboardType.email,
                                returnKeyType: UIReturnKeyType.next)
       return textField
    }()
    
    public let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Text.password.rawValue.capitalized
        textField.font = UIFont(name: "Avenir", size: 17.0)
        textField.textColor = UIColor.darkGray
        textField.minimumFontSize = 17.0
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.setUpKeyboard(KeyboardType.password,
                                returnKeyType: UIReturnKeyType.send)
        return textField
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.titleLabel?.font = UIFont(name: "Roboto-Thin", size: 17.0)
        button.setTitle(Text.login.rawValue, for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        button.set(cornerRadius: 5.0)
        return button
    }()
    
    //Lazy to allow use of self in closure.
    //unowned self to prevent retain cycle since closures are reference types
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField,
                                                       self.passwordTextField,
                                                       self.loginButton])
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 10.0
        
        return stackView
    }()
    

}
