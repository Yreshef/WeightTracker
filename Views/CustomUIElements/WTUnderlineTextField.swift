//
//  WTUnderlineTextField.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class WTUnderlineTextField: UIView {
    
    public override var tag: Int {
        didSet {
            self.textField.tag = tag
        }
    }
    
    public var underlineColor: UIColor? {
        get {
            return underlineView.backgroundColor
        }
        set {
            underlineView.backgroundColor = newValue
        }
    }
    
    // MARK: - Components
    //=============================

    let textField: WTTextField = {
        let textfield = WTTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return textfield
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        view.backgroundColor = .white
        
        return view
    }()
    
    // MARK: - Life Cycle
    //=============================

    public init() {
        super.init(frame: .zero)
        // add textfield and view
        addSubview(textField)
        addSubview(underlineView)
        
        // underline constraint bottom left right
        underlineView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        underlineView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        underlineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        // textfield constraints top left and right and bototm to top of underline
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: underlineView.topAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
