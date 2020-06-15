//
//  ForgotPasswordVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 10/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let forgotPasswordView = ForgotPasswordView()
    
    // MARK: - Initializers
    //=============================
    init() {
           super.init(nibName: nil, bundle: nil)
           view.addSubview(forgotPasswordView)
           forgotPasswordView.anchor(top: view.topAnchor,
                                   leading: view.leadingAnchor,
                                   bottom: view.bottomAnchor,
                                   trailing: view.trailingAnchor)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    // MARK: - View Life Cycle
    //=============================

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotPasswordView.addBackButtonTarget(target: self,
        action: #selector(backButtonTapped),
        for: .touchUpInside)
        
        
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    // MARK: - Methods
    //=============================

    @objc private func backButtonTapped() {
        //TODO: Implement
    }
    
}
