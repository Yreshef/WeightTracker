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
    private let environment: AppEnvironment
    
    private let settingsCellView = SettingsCellView()
    
    //TODO: Move to constants
    private let rowHeight: CGFloat = 50
    private let headerHeight: CGFloat = 40
    
    // MARK: - Initializers
    //=============================
    init(environment: AppEnvironment) {
        weightFacade = environment.weightFacade
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
        
        switch section {
        case .General:
            if let option = GeneralOptions(rawValue: indexPath.row) {
                switch option {
                case .measurementUnit:
                    let measurementVC = MeasurementUnitVC()
                    self.navigationController?.pushViewController(measurementVC,
                                                                  animated: true)
                case .helpAndFeedback:
                    let helpAndFeedbackVC = HelpAndFeedbackVC(enviornment: environment)
                    self.navigationController?.pushViewController(helpAndFeedbackVC,
                                                                  animated: true)
                case .notifications:
                    return
                }
            }
        case .Profile:
            if let option = ProfileOptions(rawValue: indexPath.row) {
                switch option {
                case .editProfile:
                    let editProfileVC = EditProfileVC()
                    self.navigationController?.pushViewController(editProfileVC,
                                                                  animated: true)
                case .logout:
                    self.logoutAlert()
                    
                }
            }
        }
    }
    
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
    
    //TODO: Implement this
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
    
    //TODO: Lookup: Should i add weak self here?
    private func logoutAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Logout", message: "Are you sure you want to log out?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let addAction = UIAlertAction(title: "Logout", style: .destructive) { (action) in
                self.logout()
            }
            alert.addAction(addAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

