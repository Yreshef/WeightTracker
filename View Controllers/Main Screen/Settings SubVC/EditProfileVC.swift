//
//  EditProfileVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 26/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    // MARK: - Properties
    //=============================
        
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
    }
    
    
    // MARK: - Methods
    //=============================
}
