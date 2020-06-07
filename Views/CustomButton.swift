////
////  LoginButton.swift
////  WeightTracker
////
////  Created by Yohai Reshef on 06/06/2020.
////  Copyright © 2020 Yohai Reshef. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//
//class CustomButton: UIButton {
//    
//    
//    // MARK: - Properties
//    //=============================
//
//    
//    
//    
//    // MARK: - Initializers
//    //=============================
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//    }
//    
//    required init?(coder aDecoder :NSCoder) {
//        super.init(coder: aDecoder)
//        setupButton()
//    }
//    
//    // MARK: - Methods
//    //=============================
//
//    private func setupButton() {
//        setShadow()
//        setTitleColor(.white, for: .normal)
//        
//        
//        //TODO: Add color scheme and implement here
//        backgroundColor = Color.lightBackground.value
//        //        titleLabel?.font = UIFont(name: "Placeholder", size: 18) //TODO: add my fonts
//        layer.cornerRadius = 25
//        layer.borderWidth = 3.0
//        layer.borderColor = Color.border.value.cgColor //TODO: Decide which color goes here
//    }
//    
////    private func buttonConstraints() {
//        //TODO: Add button constraints ---- Should i do this as a generic func?
//        // or extensions?
////    }
//    
//    private func setShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
//        layer.shadowRadius = 8
//        layer.shadowOpacity = 0.5
//        clipsToBounds = true
//        layer.masksToBounds = false
//    }
//    
//    private func shake() {
//        let shake = CABasicAnimation(keyPath: "position")
//        shake.duration = 0.1
//        shake.repeatCount = 2
//        shake.autoreverses = true
//        
//        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
//        let fromValue = NSValue(cgPoint: fromPoint)
//        
//        let toPoint = CGPoint(x: center.x + 8, y: center.y)
//        let toValue = NSValue(cgPoint: toPoint)
//        
//        shake.fromValue = fromValue
//        shake.toValue = toValue
//        
//        layer.add(shake, forKey: "position")
//    }
//}
