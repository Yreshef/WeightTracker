//
//  HomeBMIScaleView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 16/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import TGPControls


public final class HomeBMIScaleView: UIView {
    
    // MARK: - Components
    //=============================
    
//    private let minValue: CGFloat = 15.0
//    private let maxValue: CGFloat = 40.0
//    private let interval: CGFloat = 0.1
    
//    private let tickWidth: CGFloat = 0
    
    // MARK: - Life Cycle
    //=============================
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(bmiSlider)
        setConstraints()
        setUIElements()
        addTicksToSlider()
        //TODO: Disable user interaction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    //=============================
    
    private let bmiSlider: TGPDiscreteSlider = {
        let slider = TGPDiscreteSlider()
        slider.trackThickness = 10
        slider.tintColor = UIColor.white
        slider.trackStyle = 2
        slider.tickStyle = 2
        slider.tickSize = CGSize(width: 2, height: 25)
        return slider
    }()
    
//    private let bmiSlider: UISlider = {
//        let slider = UISlider()
//        slider.tintColor = UIColor.green
//
//        return slider
//    }()
        
    // MARK: - Methods
    //=============================
    
    private func addTicksToSlider() {
        //TODO: Add ticks to the slider
        
        
        //TODO: Color the ticks with appropriate colors
    }
    
    private func valueBubble() {
        //TODO: Add a tooltip above the slider showing the slider's value
    }
    
    private func setConstraints() {
        bmiSlider.anchor(to: self)
    }
    
    private func setUIElements() {
        
        //TODO: Add numbers below the slider showing values between 15-40 with jumps of 5
        bmiSlider.minimumValue = 0
        bmiSlider.tickCount = 40
        bmiSlider.value = 0
        bmiSlider.trackStyle = 3
        bmiSlider.thumbStyle = 3
        bmiSlider.isUserInteractionEnabled = false
        
        bmiSlider.maximumTickTintColor = UIColor.red
        bmiSlider.minimumTickTintColor = UIColor.green
        
        if bmiSlider.value > 0 && bmiSlider.value <= 15 {
            
        }

    }
    

    
}
