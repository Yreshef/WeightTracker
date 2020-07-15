//
//  WTTextField.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 08/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

public class WTTextField: UITextField {
    
    // MARK: - Components
    //=============================
    
    let tfFont = "Montserrat-Medium"
    let tfFontSize: CGFloat = 17.0
    let tfTextColor: UIColor = .white
    let tfMinFontSize: CGFloat = 17.0
    let tfBorderStyle: UITextField.BorderStyle = .none
    
    // MARK: - Life Cycle
    //=============================
    
    public override init(frame: CGRect) {
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
        placeholder = ""
        font = UIFont(name: tfFont, size: tfFontSize)
        textColor = tfTextColor
        minimumFontSize = 17.0
        borderStyle = tfBorderStyle
        
    }
    
    private func setupTextField(placeholder: String,
                                font: String,
                                fontSize: CGFloat,
                                textColor: UIColor,
                                minFontSize: CGFloat,
                                borderStyle: UITextField.BorderStyle){
        self.placeholder = placeholder
        self.font = UIFont(name: font, size: fontSize)
        self.textColor = textColor
        self.minimumFontSize = minFontSize
        self.borderStyle = borderStyle
    }
}

extension WTTextField {
    func setAttributedText(placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}


