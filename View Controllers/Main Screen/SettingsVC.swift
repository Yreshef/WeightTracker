//
//  SettingsVC.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 18/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Firebase

class SettingsVC: UITableViewController {
    
    // MARK: - Properties
    //=============================
    
    private let weightFacade: WeightFacadable
    private let databaseFacade: DatabaseFacadable
    private let environment: AppEnvironment
    
    private let settingsCellView = SettingsCellView()
    
    private let rowHeight: CGFloat = 50
    private let headerHeight: CGFloat = 40
    
    
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
        tableView.backgroundColor = Constants.backgroundColor
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSections(rawValue: section) else { return 0 }
        
        switch section {
        case .General: return GeneralOptions.allCases.count
        case .Profile: return ProfileOptions.allCases.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! SettingsCellView
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .General:
            if let general = GeneralOptions(rawValue: indexPath.row){
                cell.setup(type: general)
            }
        case .Profile:
            if let profile = ProfileOptions(rawValue: indexPath.row) {
                cell.setup(type: profile)
               
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.backgroundColor = Constants.backgroundColor
        label.text = SettingsSections(rawValue: section)?.description
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        view.addSubview(label)
        label.anchor(to: view, padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    //TODO: Complete this!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return }
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        switch section {
        case .General:
            if let option = GeneralOptions(rawValue: indexPath.row) {
                switch option {
                case .measurementUnit:
                    let measurementVC = MeasurementUnitVC()
                    self.navigationController?.pushViewController(measurementVC, animated: true)
                case .about:
                    self.navigationController?.pushViewController(vc, animated: true)
                case .notifications:
                    return
                }
            }
        case .Profile:
            if let option = ProfileOptions(rawValue: indexPath.row) {
                switch option {
                case .editProfile:
                    self.navigationController?.pushViewController(vc, animated: true)
                case .logout:
                
                    logout()
                }
            }
        }
    }
    
    //TODO: Remove the arrow from logout in the settings menu
    // MARK: - Methods
    //=============================
    
    
    private func setupUI() {
        tableView.register(SettingsCellView.self, forCellReuseIdentifier: "cellId")
        tableView.rowHeight = rowHeight
        addButtonTarget()

        
    }
    
    @objc private func switchControlTapped(sender: UISwitch) {
        if sender.isOn {
            print("Swith is turned on")
        } else {
            print("Swith is turned off")
        }
    }
    
    //TODO: Ask Dan why this wont work
    private func addButtonTarget() {
        settingsCellView.addSwitchControlTarget(target: self,
                                                action: #selector(switchControlTapped),
                                                for: .valueChanged)
    }
    
    private func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        let loginVC = LoginVC(environment: environment)
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
}

