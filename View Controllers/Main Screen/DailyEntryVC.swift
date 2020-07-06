//
//  DailyInputVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 18/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class DailyEntryVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    private let environment: AppEnvironment
    
    private let entryCellView = EntryCellView()
    private let entryTableView = EntryTableView()
    
    private let rowHeight: CGFloat = 60
    
    // MARK: - Initializers
    //=============================
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
        databaseFacade = environment.databaseFacade
        self.environment = environment
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Disable Landsacpe
    //=============================
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - TableView Methods
    //=============================
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Implement!
    }
    
    
    // MARK: - Methods
    //=============================
    
    private func setupUI() {
        entryTableView.tableView.register(EntryCellView.self, forCellReuseIdentifier: "cellId")
        entryTableView.tableView.rowHeight = rowHeight
        
    }
}


extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! EntryCellView
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    
}


