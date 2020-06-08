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

    private let titleFont = "Montserrat-Bold"
    private let fontSize: CGFloat = 17.0
    private let color: UIColor = .white
    private let background: UIColor = .clear
    private let borderColor: UIColor = .white
    private let borderWidth: CGFloat = 1.0
    private let cornerRadius: CGFloat = 5.0
    
    
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
                    bgColor: backgroundColor,
                    borderColor: borderColor, borderWidth: borderWidth,
                    cornerRadius: cornerRadius)
    }
    
    required init?(coder aDecoder :NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Methods
    //=============================

    private func setupButton(){
        self.setupButton(font: UIFont(name: titleFont, size: fontSize),
                         titleColor: color, bgColor: background,
                         borderColor: borderColor.cgColor, borderWidth: borderWidth, cornerRadius: cornerRadius)
    }
    
    private func setupButton(font: UIFont?,
                             titleColor: UIColor,
                             bgColor: UIColor,
                             borderColor: CGColor,
                             borderWidth: CGFloat,
                             cornerRadius: CGFloat) {
        
        titleLabel?.font = font
        setTitleColor(titleColor, for: UIControl.State.normal)
        backgroundColor = bgColor
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        set(cornerRadius: cornerRadius)
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
//TODO: Move the animation to extension Layer {}
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
