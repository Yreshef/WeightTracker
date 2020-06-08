//
//  WTButton.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 06/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Foundation


class WTButton: UIButton {
    
    
    // MARK: - Properties
    //=============================

    let customButton: UIButton = UIButton(type: UIButton.ButtonType.system)

    let titleFont = "Montserrat-Bold"
    let fontSize: CGFloat = 17.0
    let color: UIColor = .white
    let background: UIColor = .clear
    let borderColor: UIColor = .white
    let borderWidth: CGFloat = 1.0
    let cornerRadius: CGFloat = 5.0
    
    
    // MARK: - Initializers
    //=============================

    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    init(font: UIFont,
         titleColor: UIColor,
         backgroundColor: UIColor,
         borderColor: CGColor,
         borderWidth: CGFloat,
         cornerRadius: CGFloat) {
        
        super.init(frame: .zero)
        setupButton(font: font, titleColor: titleColor,
                    backgroundColor: backgroundColor,
                    borderColor: borderColor, borderWidth: borderWidth,
                    cornerRadius: cornerRadius)
    }
    
    required init?(coder aDecoder :NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Methods
    //=============================

    private func setupButton(){
        customButton.titleLabel?.font = UIFont(name: titleFont, size: fontSize)
        customButton.setTitleColor(color, for: UIControl.State.normal)
        customButton.backgroundColor = background
        customButton.layer.borderColor = borderColor.cgColor
        customButton.layer.borderWidth = borderWidth
        customButton.set(cornerRadius: cornerRadius)
    }
    
    private func setupButton(font: UIFont,
                             titleColor: UIColor,
                             backgroundColor: UIColor,
                             borderColor: CGColor,
                             borderWidth: CGFloat,
                             cornerRadius: CGFloat) {
        
        customButton.titleLabel?.font = font
        customButton.setTitleColor(titleColor, for: UIControl.State.normal)
        customButton.backgroundColor = backgroundColor
        customButton.layer.borderColor = borderColor
        customButton.layer.borderWidth = borderWidth
        customButton.set(cornerRadius: cornerRadius)
    }
   
    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
}

extension WTButton {
    
    // MARK: - Animations
    //=============================

    private func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}
