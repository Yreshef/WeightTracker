//
//  LoginVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Firebase


public final class LoginVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let loginScreenView: LoginScreenView = LoginScreenView()
//    private let viewModel: LoginViewModelable
    
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    private let authService: AuthServicable
    
    private let enviroment: AppEnvironment
    
    // MARK: - Initializers
    //=============================
    //TODO: Confrom to MVVM
    
//    init(viewModel: LoginViewModelable){
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
    init(environment: AppEnvironment) {
        
        self.weightFacade = environment.weightFacade
        self.databaseFacade = environment.databaseFacade
        self.enviroment = environment
        
        self.authService = environment.authService
        
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(loginScreenView)
        loginScreenView.anchor(top: view.topAnchor,
                               leading: view.leadingAnchor,
                               bottom: view.bottomAnchor,
                               trailing: view.trailingAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Move to ModelView 
        loginScreenView.addSignUpButtonTarget(target: self,
                                              action: #selector(userSignupButtonTapped),
                                              for: .touchUpInside)
        loginScreenView.addLoginButtonTarget(target: self,
                                             action: #selector(loginButtonTapped),
                                             for: .touchUpInside)
        loginScreenView.addForgotPasswordButtonTarget(target: self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    // MARK: - Methods
    //=============================
    
    @objc private func loginButtonTapped() {
        guard let email = loginScreenView.emailTextField.textField.text, let password = loginScreenView.passwordTextField.textField.text else {
            showAlert(title: "Oops", message: "Please fill in all fields")
            return
        }
        authService.signIn(email: email, password: password, completion: { [unowned self] user in
            guard let user = user else {
                self.showAlert(title: "Login failed for use", message: "Check if all the fields are correct")
                return
            }
            let tabBarVC = TabBarVC()
            tabBarVC.modalPresentationStyle = .fullScreen
            self.present(tabBarVC, animated: true, completion: nil)
        })
    }
    
    @objc private func userSignupButtonTapped() {
        // Transition to SignUpVC
        let signUpVC = SignUpVC(environment: enviroment)
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func forgotPasswordButtonTapped() {
         //TODO: validate that user exists
        let forgotPasswordVC = ForgotPasswordVC()
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgotPasswordVC, animated: true, completion: nil)
        
//        viewModel.forgotPasswordTapped()
    }
    
    //TODO: consider writing a show alert service instead of an extension
    
    
}

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: { action in }))
        self.present(alertController, animated: true, completion: nil)
    }
}
