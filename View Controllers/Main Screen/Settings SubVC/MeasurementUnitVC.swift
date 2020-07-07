//
//  MeasurementUnitVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 26/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class MeasurementUnitVC: UITableViewController {
    
    // MARK: - Properties
    //=============================
    
    private let measurementUnitCellView = MeasurementUnitCellView()
    
    private let rowHeight: CGFloat = 50
    private let headerHeight: CGFloat = 40
    
    private let options = ["KG", "LBS"]
    
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
        setupUI()
    }
    
    // MARK: - TableView Methods
    //=============================
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MeasurementUnitCellView
        cell.measurementUnitLabel.text = options[indexPath.row]
        if cell.measurementUnitLabel.text != "KG" {
            cell.checkmarkButton.isHidden = true
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.backgroundColor = Constants.backgroundColor
        label.text = "Options"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        view.addSubview(label)
        label.anchor(to: view, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Subviews
    //=============================
    
    
    // MARK: - Methods
    //=============================

    private func setupUI() {
       tableView.register(MeasurementUnitCellView.self, forCellReuseIdentifier: "cellId")
       tableView.rowHeight = rowHeight
        
    }
}
