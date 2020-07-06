//
//  HomeBMIScaleView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 16/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class HomeBMIScaleView: UIView {
    
    // MARK: - Components
    //=============================
    

    // MARK: - Life Cycle
    //=============================
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
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
    }
    
    private func setUIElements() {
        
        //TODO: Add numbers below the slider showing values between 15-40 with jumps of 5

    }
    
    public func populateUI(bmi: Float) {
        //TODO: implement
    }
}
