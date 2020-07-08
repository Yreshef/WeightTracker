//
//  CircleDataView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 15/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

//TODO: Add the layer underneath the blue circle line
public class CircleDataView: UIView {
    
    // MARK: - Components
    //=============================
    
    let circleBorderLayer = CAShapeLayer()
    let circleFillLayer = CAShapeLayer()
    
    // MARK: - Life Cycle
    //=============================
    
    init() {
        super.init(frame: .zero)
        addSubview(circleView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.drawCircle(center: circleView.center, radius: (circleView.frame.height / 2) - 11)
    }
    
    
    // MARK: - Subviews
    //=============================
    
    
    /// The view to show the layers for the bezer path
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    public let precentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "69%"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        
        //TODO: Add background color to spice things up a bit
//        label.backgroundColor = .white
//        label.layer.shadowColor = UIColor.black.cgColor
//        label.layer.shadowOffset = .zero
//        label.layer.shadowRadius = 1
//        label.layer.shadowOpacity = 0.4
//        label.layer.cornerRadius = 25
        
        return label
    }()
    
    public let currentWeightLabel: UILabel = {
        let label = UILabel()
        
        label.text = "68.5"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50)
        
        return label
    }()
    
    private let innerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var innerStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.precentLabel,
                                                       self.currentWeightLabel])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillProportionally
        
        return stackview
    }()
    
    
    // MARK: - Methods
    //=============================
    
    private func drawCircle(center: CGPoint, radius: CGFloat) {
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -(CGFloat.pi / 2), endAngle: 1.5 * CGFloat.pi, clockwise: true)
        circleBorderLayer.path = circularPath.cgPath
        circleBorderLayer.strokeColor = UIColor.blue.cgColor
//        circleBorderLayer.strokeEnd = 1.5 * CGFloat.pi
        circleBorderLayer.strokeEnd = 0
        circleBorderLayer.lineWidth = 10
        circleBorderLayer.lineCap = CAShapeLayerLineCap.round
        circleBorderLayer.fillColor = UIColor.clear.cgColor
        
        let circleFillPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -(CGFloat.pi / 2), endAngle: 1.5 * CGFloat.pi, clockwise: true)
        circleFillLayer.path = circleFillPath.cgPath
        circleFillLayer.strokeColor = UIColor.gray.cgColor
        circleFillLayer.strokeEnd = 1.5 * CGFloat.pi
        circleFillLayer.lineWidth = 2
        circleFillLayer.lineCap = CAShapeLayerLineCap.round
        circleFillLayer.fillColor = UIColor.clear.cgColor
        
    }
    
    private func getClearViewMultiplier() -> CGFloat {
        let multiplier: CGFloat = 1 - 0.3218
        let padding: CGFloat = 0.1
        return multiplier - padding
    }
    
    private func setConstraints() {
        
        circleView.anchor(top: self.topAnchor,
                          leading: self.leadingAnchor,
                          bottom: self.bottomAnchor,
                          trailing: self.trailingAnchor)
        circleView.backgroundColor = .white
        circleView.layer.addSublayer(circleFillLayer)
        circleView.layer.addSublayer(circleBorderLayer)
        
        //Inner circle clear view
        addSubview(innerView)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        self.bringSubviewToFront(innerView)
        innerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        innerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        innerView.widthAnchor.constraint(equalTo: innerView.heightAnchor).isActive = true
        innerView.heightAnchor.constraint(equalTo: circleView.heightAnchor, multiplier: getClearViewMultiplier()).isActive = true
        innerView.backgroundColor = .clear
        
        //Stack view
        innerView.addSubview(innerStackView)
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.centerXAnchor.constraint(equalTo: innerView.centerXAnchor).isActive = true
        innerStackView.centerYAnchor.constraint(equalTo: innerView.centerYAnchor).isActive = true
    }
    
    public func populateUI(progress: Int, currentWeight: Float) {
        currentWeightLabel.text = String(currentWeight)
        precentLabel.text = String(progress) + "%"
        // Draw the progress of the user on the circle
        fillCircle(progress: progress)
    }
    
    
    @objc private func fillCircle(progress: Int) {
        //TODO: Add user progress % and fill accordingly
        print("Attempting to animate the cricle fill")
        
        let fillAnimation = CABasicAnimation(keyPath: "strokeEnd")
        fillAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        fillAnimation.toValue = Double(progress) / 100
        fillAnimation.duration = 3
        fillAnimation.fillMode = CAMediaTimingFillMode.forwards
        fillAnimation.isRemovedOnCompletion = false
        circleBorderLayer.add(fillAnimation, forKey: "funTimes")
    }

}
