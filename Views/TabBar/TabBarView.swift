//
//  TabBarView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 18/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

@IBDesignable
class TabBarView: UITabBar {
    
    // MARK: - Components
    //=============================
    private var shapeLayer: CALayer?
    
    // MARK: - Life Cycle
    //=============================
    
    // MARK: - Subviews
    //=============================
    
    
    // MARK: - Methods
    //=============================
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        //Adds shadow above the bar
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 10
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) //start top left
        path.addLine(to: CGPoint(x:  (centerWidth - (height * 2)), y: 0)) //the beggining of the trough
        
        path.addCurve(to: CGPoint(x: centerWidth + (height * 2), y: 0), controlPoint1: CGPoint(x: centerWidth + 35, y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}