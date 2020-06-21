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
    
    private let graphView = GraphView()
    
    // MARK: - Initializers
    //=============================
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(graphView)
        graphView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    //=============================
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    // MARK: - Methods
    //=============================
}
