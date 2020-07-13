//
//  GraphVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public final class GraphVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    private let weightFacade: WeightFacadable
    private let environment: AppEnvironment
    
    
    
    // MARK: - Initializers
    //=============================
    
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
        self.environment = environment
        
        super.init(nibName: nil, bundle: nil)
//        view.addSubview(graphView)
//        graphView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        let graphView = GraphView(coder: coder)

    }
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


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
    
    
}

//TODO: Ask dan if anything can be implemented in the tabBarVC.
/**
 Create a graph showing the user's progress over a given period of time: weekly, monthly yearly etc.
 The graph will be populated  with every new entry, so needs to be refreshed every time there is a new input.
 add different types of graphs after the 1st one is working as intended.
 */
