////
////  CircularDataView.swift
////  IVolunteer
////
////  Created by Dan Draiman on 6/15/20.
////  Copyright © 2020 IVolunteer International. All rights reserved.
////
//
//import UIKit
//
//class CircularDataView: UIView {
//    private var circleRadius: CGFloat {
//        return (circleView.frame.height / 2) - circlePadding
//    }
//    private let circleFillWidth: CGFloat = 4
//    private let circlePadding: CGFloat = 8
//    private var contentPadding: CGFloat {
//        return circleFillWidth + (circlePadding * 2) + 8
//    }
//    var dataTitle: String = ""
//    var dataValue: Float = 0
//    var dataMinValue: Float = 0
//    var dataMaxValue: Float = 1
//    
//    private let contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        return view
//    }()
//    
//    private let circleView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    init() {
//        super.init(frame: .zero)
//        addSubview(circleView)
//        circleView.anchor(in: self)
//        circleView.backgroundColor = .blue
//        circleView.layer.addSublayer(circleBorderLayer)
//        circleView.layer.addSublayer(circleFillLayer)
//        
//        circleView.addSubview(contentView)
//        contentView.widthAnchor.constraint(equalTo: circleView.widthAnchor, multiplier: 0.1).isActive = true
//        contentView.center(in: circleView)
//        contentView.anchor(in: circleView, padding: .init(top: contentPadding, left: contentPadding, bottom: contentPadding, right: contentPadding))
//    }
//    
//    let circleBorderLayer = CAShapeLayer()
//    let circleFillLayer = CAShapeLayer()
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func drawCircle(center: CGPoint, radius: CGFloat) {
//        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
//        circleBorderLayer.path = circlePath.cgPath
//
//        circleBorderLayer.fillColor = UIColor.clear.cgColor
//        circleBorderLayer.strokeColor = UIColor.white.cgColor
//        circleBorderLayer.lineWidth = 2.0
//        
//        let circleFillPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.5 * .pi, endAngle: 1.5 * .pi, clockwise: true)
//        circleFillLayer.path = circleFillPath.cgPath
//
//        circleFillLayer.fillColor = UIColor.clear.cgColor
//        circleFillLayer.strokeColor = UIColor.red.cgColor
//        circleFillLayer.lineWidth = circleFillWidth
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        drawCircle(center: circleView.center, radius: circleRadius)
//        //TODO: Update Layer here
//    }
//}
