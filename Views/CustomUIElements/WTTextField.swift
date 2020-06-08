//
//  WTTextField.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 08/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

class WTTextField: UITextField {
    
    // MARK: - Properties
    //=============================

    let textField = UITextField()
    
    let tfFont = ""
    let tfFontSize: CGFloat = 17.0
    let tfTextColor: UIColor = .black
    let tfMinFontSize: CGFloat = 17.0
    let tfBorderStyle: UITextField.BorderStyle = UITextField.BorderStyle.roundedRect
    
    // MARK: - Initializers
    //=============================

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupTextField()
    }
    
    init(placeholder: String,
         font: String,
         fontSize: CGFloat,
         textColor: UIColor,
         minFontSize: CGFloat,
         borderStyle: UITextField.BorderStyle) {
        
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, font: font,
                       fontSize: fontSize, textColor: textColor,
                       minFontSize: minFontSize, borderStyle: borderStyle)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    //=============================

    private func setupTextField() {
        textField.placeholder = ""
        textField.font = UIFont(name: tfFont, size: tfFontSize)
        textField.textColor = tfTextColor
        textField.minimumFontSize = 17.0
        textField.borderStyle = tfBorderStyle
    }
    
    private func setupTextField(placeholder: String,
                                font: String,
                                fontSize: CGFloat,
                                textColor: UIColor,
                                minFontSize: CGFloat,
                                borderStyle: UITextField.BorderStyle){
        textField.placeholder = placeholder
        textField.font = UIFont(name: font, size: fontSize)
        textField.textColor = textColor
        textField.minimumFontSize = minFontSize
        textField.borderStyle = borderStyle
    }
    
}
