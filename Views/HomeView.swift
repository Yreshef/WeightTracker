//
//  HomeView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 09/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import SnapKit

public class HomeView: UIView {
    
    // MARK: - Properties
    //=============================
    //TODO: Implement 4 views to display data to the user.
    let bgColor: UIColor = UIColor(named: "metallicSeaweed") ?? .black
//    let homeViewFrame: UIView
//
//    let circleView: UIView = {
//        let view = UIView()
////        view.frame = CGRect.init(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//
//        return view
//    }()
//    let shapeLayer = CAShapeLayer()
//    let circularPath = UIBezierPath(arcCenter: ,
//                                    radius: 100, startAngle: 0.5 * CGFloat.pi,
//                                    endAngle: 0.5 * CGFloat.pi,
//                                    clockwise: true)
    
    
    // MARK: - Initializers
    //=============================

    init() {
        super.init(frame: .zero)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = bgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Subviews
    //=============================
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-Light", size: 20) ?? UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Roboto", size: 30) ?? UIFont.systemFont(ofSize: 60)
        
        return label
    }()
    
    
    
    let chartImage = UIImageView()
    let bmiSlider = UISlider()
    let addButton = UIButton()
    

    // MARK: - Methods
    //=============================

    private func setConstraints() {
        
    }
    
    
    
    // MARK: - Setters
    //=============================

}
