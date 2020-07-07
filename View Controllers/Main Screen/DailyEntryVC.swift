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
    private let environment: AppEnvironment
    
    private let dailyEntryView = DailyEntryView()
    private let entryCellView = EntryCellView()
    
    private var dailyEntires: [MeasurementEntry]
    
    private let headerSpacingBetweenCells: CGFloat = 10
    
    // MARK: - Initializers
    //=============================
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
        self.environment = environment
        
        dailyEntires = weightFacade.measurementHistory
        
        super.init(nibName: nil, bundle: nil)
        
        dailyEntryView.tableView.delegate = self
        dailyEntryView.tableView.dataSource = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    //=============================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print("My name is Inigo Montoya, you killed my father \(dailyEntires.count) times, prepare to die!")
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
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        dailyEntires.count
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerSpacingBetweenCells
    }
    
    internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Implement!
    }
    
    internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! EntryCellView
        
        cell.dateLabel.text = dailyEntires[indexPath.row].date.getInEuropeanDateFormat()
        
        let attributedTitle = NSMutableAttributedString(string: String(dailyEntires[indexPath.row].weight), attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
        attributedTitle.append(NSAttributedString(string: "KG", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        cell.weightLabel.attributedText = attributedTitle
        
        return cell
    }
    
    
    
    // MARK: - Methods
    //=============================
    
    private func setupUI() {
        view.addSubview(dailyEntryView)
        dailyEntryView.anchor(to: self.view)
        dailyEntryView.tableView.register(EntryCellView.self, forCellReuseIdentifier: "cellId")
        dailyEntryView.tableView.rowHeight = Constants.tableViewRowHeight        
    }
}


extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 0 }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { return UITableViewCell() }
}


