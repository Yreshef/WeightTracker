//
//  LoginVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public final class LoginVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let loginScreenView: LoginScreenView = LoginScreenView()
//    private let viewModel: LoginViewModelable
    
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    
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
        //TODO: implement
//        viewModel.loginButtonTapped()
        let tabBarVC = TabBarVC()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
    
    @objc private func userSignupButtonTapped() {
        // Transition to SignUpVC
        let signUpVC = SignUpVC()
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
    

    
                
    //TODO: See if some of the features exist in Firebase already
    
    
}
