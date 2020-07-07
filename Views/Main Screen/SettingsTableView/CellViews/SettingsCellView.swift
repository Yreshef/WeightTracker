//
//  SettingsCellView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 17/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class SettingsCellView: UITableViewCell {
    
    // MARK: - Components
    //=============================
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.constainsSwitch
        }
    }
    
    
    // MARK: - Life Cycle
    //=============================
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Subviews
    //=============================
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.onTintColor = UIColor(named: "yaleBlue")
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        //        switchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return switchControl
    }()
    
    private lazy var cellStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.nameLabel,
                                                       self.switchControl])
        
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.distribution = .fill
        
        return stackview
    }()
    
    
    // MARK: - Methods
    //=============================
    
    private func setupView() {
        addSubview(cellStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        cellStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
    }
    
    func addSwitchControlTarget(target: Any, action: Selector,
                                for event: UIControl.Event) {
        switchControl.addTarget(target, action: action, for: event)
    }
    
    func setup(type: SectionType){
        textLabel?.text = type.description
        switchControl.isHidden = !type.constainsSwitch
        accessoryType = type.containsArrow ? .disclosureIndicator : .none
    }
    
    //    @objc private func handleSwitchAction(sender: UISwitch) {
    //        if sender.isOn {
    //            print("Switch is on")
    //        } else {
    //            print("Switch is off")
    //        }
    //    }
}


