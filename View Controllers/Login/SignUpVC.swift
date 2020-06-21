//
//  SignUpVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Firebase


public class SignUpVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let signUpScreenView = SignUpScreenView()
    private let authService: AuthServicable
    private let environment: AppEnvironment
    
    
//    private let signUpModel = SignUpModel()
    
    // MARK: - Initializers
    //=============================
    
    
    init(environment: AppEnvironment) {
        self.authService = environment.authService
        self.environment = environment

        super.init(nibName: nil, bundle: nil)
        view.addSubview(signUpScreenView)
        signUpScreenView.anchor(top: view.topAnchor,
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
    
    public override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    // MARK: - Methods
    //=============================
    
    private func alertMessage(alertMessage: String) {
        let alertController = UIAlertController(title: "Unable to submit",
        message: "Sorry, your \(alertMessage)s were not matcahing.",
        preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    private func addButtonTargets() {
        signUpScreenView.addSignUpButtonTarget(target: self, action: #selector(userSignupButtonTapped), for: .touchUpInside)
    }
    
    @objc private func userSignupButtonTapped() {
        guard let email = signUpScreenView.emailTextField.textField.text,
            let password = signUpScreenView.passwordTextField.textField.text,
            let username = signUpScreenView.usernameTextField.textField.text else {
            print("Hello")
            return
        }
        //TODO: Fix this! v
        authService.signUp(email: email, password: password) { (user) in
            if user != nil {
                let tabBarVC = TabBarVC()
                tabBarVC.modalPresentationStyle = .fullScreen
                self.present(tabBarVC, animated: true, completion: nil)
            } else {
                self.showAlert(title: "Oops!", message: "Please fill in all fields")
            }
        }
    }
    
    @objc private func backButtonTapped() {
        //TODO: How to go back to previous VC without calling the enviornemnt VC
        
    }
    

    
    
    
}




