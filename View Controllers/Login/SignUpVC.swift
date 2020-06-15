//
//  SignUpVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class SignUpVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let signUpScreenView = SignUpScreenView()
//    private let signUpModel = SignUpModel()
    
    
    
    
    // MARK: - Initializers
    //=============================
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(signUpScreenView)
        signUpScreenView.anchor(top: view.topAnchor,
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
    
    
}





