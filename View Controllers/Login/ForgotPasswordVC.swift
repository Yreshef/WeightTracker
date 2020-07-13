//
//  ForgotPasswordVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 10/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Firebase


class ForgotPasswordVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let authService: AuthServicable
    private let environment: AppEnvironment
    
    private let forgotPasswordView = ForgotPasswordView()
    
    // MARK: - Initializers
    //=============================
    init(environment: AppEnvironment) {
        
        authService = environment.authService
        self.environment = environment
        
        super.init(nibName: nil, bundle: nil)
        view.addSubview(forgotPasswordView)
        forgotPasswordView.anchor(top: view.topAnchor,
                                  leading: view.leadingAnchor,
                                  bottom: view.bottomAnchor,
                                  trailing: view.trailingAnchor)
        addButtonTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
    }
    
    // MARK: - Disable Landscape
    //=============================
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - Methods
    //=============================
    @objc private func submitButtonTapped() {
        guard let email = forgotPasswordView.emailTextField.textField.text else {
            print("Relevent field is empty")
            return
        }
        print(email)
        sendResetEmail(email: email)
        presentLoginVC(environment: environment)
    }
    
    @objc private func signInButtonTapped() {
        presentLoginVC(environment: environment)
        
    }
    
    private func addButtonTargets() {
        forgotPasswordView.addSignInButtonTarget(target: self,
                                                 action: #selector(signInButtonTapped),
                                                 for: .touchUpInside)
        
        forgotPasswordView.addSubmitButtonTarget(target: self,
                                                 action: #selector(submitButtonTapped),
                                                 for: .touchUpInside)
    }
    
    //TODO: Set a password reset email template on Firebase
    private func sendResetEmail(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error! description: \(error.localizedDescription)")
            }
        }
        print("Success!")
    }
    
    private func presentLoginVC(environment: AppEnvironment) {
        let loginVC = LoginVC(environment: environment)
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}
