//
//  GraphView.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 12/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit
import Macaw

public class GraphView: MacawView {
    
    // MARK: - Properties
    //=============================
    
    private static var fiveEntries = createDummyData()
    
    private static let maxValue = 120
    private static let maxValueLineHeight = 250
    private static let lineWidth: Double = 200
    
    private static var dataDivisor = Float(maxValue/maxValueLineHeight)
    private static var adjustedData: [Float] = fiveEntries.map({ $0.weight / dataDivisor})
    private var animations: [Animation] = []
        
        // MARK: - Initializers
        //=============================
        
    required init?(coder aDecoder: NSCoder) {
        super.init(node: GraphView.createChart(), coder: aDecoder)
        
        backgroundColor = Constants.backgroundColor
        addSubview(chartStackView)
        addConstraints()
    }
    
    
    
    // MARK: - Subviews
    //=============================
    
    
    
    
    
    private lazy var chartStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [])
        
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        
        
        
        return stackview
    }()
    
    
    
    // MARK: - Methods
    //=============================
    
    private func addConstraints() {
        chartStackView.translatesAutoresizingMaskIntoConstraints = false
        chartStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 36).isActive = true
        chartStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 36).isActive = true
        chartStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -36).isActive = true
    }
    
    private static func createChart() -> Group{
        var items: [Node] = addXAxisItems() + addXAxisItems()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node]{
        let maxLines = 6
        let lineInterval = Int(maxValue/maxLines)
        let yAxisHeight: Double = 200
        let lineSpacing: Double = 30
        return []
    }
    
    private static func addXAxisItems() -> [Node]{
        return []
    }
    
    private static func createBars() -> Group {
        return Group()
    }
    
    private static func createDummyData() -> [MeasurementEntry] {
        
        let one = MeasurementEntry(weight: 91, date: Date().addingTimeInterval(-10_000))
        let two = MeasurementEntry(weight: 90, date: Date().addingTimeInterval(-5_000))
        let three = MeasurementEntry(weight: 88, date: Date().addingTimeInterval(-3_000))
        let four = MeasurementEntry(weight: 85, date: Date().addingTimeInterval(-1_300))
        let five = MeasurementEntry(weight: 82, date: Date())
        
        return [ one, two, three, four, five]
    }
    
}
