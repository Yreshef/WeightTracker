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
    private let bgColor: UIColor = UIColor(named: "yaleBlue") ?? .black
    private let emailImage: UIImage? = UIImage(named: "emailWhite")

    
    // MARK: - Life Cycle
    //=============================
    
    public init() {
        super.init(frame: .zero)
        
        backgroundColor = bgColor
        addSubview(mainStackView)
        addSubview(bottomStackView)
        
        setConstraint()
        setUIElements()
        setKeyboardType()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Don't worry, it happens to the best of us.
        Please enter you email below, and we'll get on fixing it right away!
        """
        label.font = UIFont(name: "Roboto", size: 17)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    public let emailTextField = WTUnderlineTextField()
    public let submitButton = WTButton()
    
    public let signInButton: UIButton = {
        let button = UIButton()
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.titleLabel,
                                                       self.emailTextField,
                                                       self.submitButton])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        stackview.spacing = 30
        
        return stackview
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.signInButton])
        
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        
        return stackview
    }()

    
    
    
    // MARK: - Methods
    //=============================
    
    private func setConstraint() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    //TODO: Change the name of this function
    func addSignInButtonTarget(target: Any,
                               action: Selector,
                               for event: UIControl.Event) {
        signInButton.addTarget(target, action: action, for: event)
    }
    
    func addSubmitButtonTarget(target: Any,
                               action: Selector,
                               for event: UIControl.Event) {
        submitButton.addTarget(target, action: action, for: event)
    }
    
    private func setKeyboardType() {
         emailTextField.textField.keyboardType = .emailAddress
    }
    
    private func setUIElements() {
        
        emailTextField.textField.setAttributedText(placeholder: "Email")
        emailTextField.textField.leftView = UIImageView(image: emailImage)
        emailTextField.textField.leftViewMode = UITextField.ViewMode.always

        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor(named: "yaleBlue"), for: .normal)
        submitButton.backgroundColor = .white
        
    }
}
