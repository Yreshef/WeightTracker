//
//  LoginVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Firebase

//TODO: (?)Wrap in nav controller and hide bar so you could pop the signup view controller
//      when you wanna back up to login VC(?)
public final class LoginVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let loginScreenView: LoginScreenView = LoginScreenView()
    
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    private let authService: AuthServicable
    private let enviroment: AppEnvironment
    
    // MARK: - Initializers
    //=============================
    
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
        addButtonTarget()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
        #if DEBUG
        loginScreenView.emailTextField.textField.text = "test@test.com"
        loginScreenView.passwordTextField.textField.text = "123456"
        #endif
    }
    
    
    // MARK: - Disable Landsacpe
    //=============================
    
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
            let tabBarVC = TabBarVC(environment: self.enviroment) //TODO: Check if its okay to use env. here
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
        let forgotPasswordVC = ForgotPasswordVC(environment: enviroment)
        forgotPasswordVC.modalPresentationStyle = .fullScreen
        self.present(forgotPasswordVC, animated: true, completion: nil)
    }
    
    private func addButtonTarget() {
        loginScreenView.addSignUpButtonTarget(target: self,
                                              action: #selector(userSignupButtonTapped),
                                              for: .touchUpInside)
        loginScreenView.addLoginButtonTarget(target: self,
                                             action: #selector(loginButtonTapped),
                                             for: .touchUpInside)
        loginScreenView.addForgotPasswordButtonTarget(target: self,
                                                      action: #selector(forgotPasswordButtonTapped),
                                                      for: .touchUpInside)
    }

    //TODO: consider writing a show alert service instead of an extension
    //TODO: Add animations
    
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
