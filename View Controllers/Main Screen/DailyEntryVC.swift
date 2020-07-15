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
    
    // MARK: - Initializers
    //=============================
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
        self.environment = environment
        
        dailyEntires = weightFacade.measurementHistory
        
        super.init(nibName: nil, bundle: nil)
        
        dailyEntryView.tableView.delegate = self
        dailyEntryView.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(measurementsChanged), name: .MeasurementDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        return weightFacade.measurementHistory.count
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerSpacingBetweenCells
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Implement an edit and save entry functionality
    }
    
    //TODO: Add notification to update the table view whenever data is changed
    //TODO: Display an image while waiting for the data being loaded from Core Data
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! EntryCellView
        let measurment = weightFacade.measurementHistory[indexPath.section]
        cell.dateLabel.text = measurment.date.readableRepresentation
        
        let attributedTitle = NSMutableAttributedString(string: String(measurment.weight), attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.black])
        attributedTitle.append(NSAttributedString(string: "KG", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.black]))
        
        cell.weightLabel.attributedText = attributedTitle
        
        return cell
    }
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //TODO: Implement

        return 0
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //TODO: Implement
        return 0
    }

    // MARK: - Methods
    //=============================
    
    private func setupUI() {
        view.addSubview(dailyEntryView)
        dailyEntryView.anchor(to: self.view)
        dailyEntryView.tableView.register(EntryCellView.self, forCellReuseIdentifier: "cellId")
        dailyEntryView.tableView.rowHeight = Constants.tableViewRowHeight        
    }
    
    @objc private func measurementsChanged() {
        DispatchQueue.main.async {
            self.dailyEntryView.tableView.reloadData()
        }
    }
}

// MARK: - Extensions
//=============================

extension DailyEntryVC: UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
}


