//
//  HomeVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public final class HomeVC: UIViewController {
    
    // MARK: - Properties
    //=============================

    private let homeView: UIView = HomeView()
    
    // MARK: - Initializers
    //=============================
    
    //TODO: Make MVVM complient
    
    //    init(viewModel: HomeViewModelable){
    //        self.viewModel = viewModel
    //        super.init(nibName: nil, bundle: nil)
    //    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Methods
    //=============================


}
