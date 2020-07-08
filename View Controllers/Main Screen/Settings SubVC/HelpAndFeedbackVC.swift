//
//  AboutVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 26/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class HelpAndFeedbackVC: UIViewController {
    
    // MARK: - Properties
    //=============================
    
    private let weightFacade: WeightFacadable
    private let environment: AppEnvironment
    
    private let helpAndFeedbackView = HelpAndFeedbackView()
    
    // MARK: - Initializers
    //=============================
    
    init(enviornment: AppEnvironment) {
        
        self.weightFacade = enviornment.weightFacade
        self.environment = enviornment
        
        super.init(nibName: nil, bundle: nil)
        helpAndFeedbackView.tableView.delegate = self
        helpAndFeedbackView.tableView.dataSource = self
        
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
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        HelpAndFeedbackSections.allCases.count
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.backgroundColor = Constants.backgroundColor
        label.text = HelpAndFeedbackSections(rawValue: section)?.description
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        view.addSubview(label)
        label.anchor(to: view, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        return view
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HelpAndFeedbackSections(rawValue: section) else { return 0 }
        
        switch section {
        case .Help: return HelpOptions.allCases.count
        case .Feedback: return FeedbackOptions.allCases.count
        case .About: return AboutOptions.allCases.count
        }
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Implement!
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HelpAndFeedbackCellView
        
        guard let section = HelpAndFeedbackSections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Help:
            if let help = HelpOptions(rawValue: indexPath.row){
                cell.setup(type: help)
            }
        case .Feedback:
            if let feedback = FeedbackOptions(rawValue: indexPath.row) {
                cell.setup(type: feedback)
            }
        case .About:
            if let about = AboutOptions(rawValue: indexPath.row) {
                cell.setup(type: about)
            }
        }
        
        return cell
    }
    
    // MARK: - Methods
    //=============================
    
    private func setupUI() {
        view.addSubview(helpAndFeedbackView)
        helpAndFeedbackView.anchor(to: self.view)
        helpAndFeedbackView.tableView.register(HelpAndFeedbackCellView.self, forCellReuseIdentifier: "cellId")
        helpAndFeedbackView.tableView.rowHeight = Constants.tableViewRowHeight
    }
}


extension HelpAndFeedbackVC: UITableViewDelegate, UITableViewDataSource {
    
}
