//
//  WeightFacade.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 29/05/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

class WeightFacade: WeightFacadable {
    
    // MARK: - Properties
    //=============================

    var measurementHistory: [MeasurementEntry] = []
    
    public static let stub = WeightFacade()

    // MARK: - Initializer
    //=============================

    init() {
        fetchMeasurementHistory()
    }
    
    // MARK: - Methods
    //=============================

    /// Appends a new measurement input from the user into the measurement history
    /// - Parameter weight: A new user weight input
    func measure(weight: Weight) {
        measurementHistory.append(MeasurementEntry(weight: weight, date: Date()))
    }
    
    private func editEntry(date: Date) {
        //TODO: Edit an entry in the database.
    }
    
    private func deleteEntry(date: Date) {
        // TODO: Delete a requested entry from the database.
    }
    
    private func fetchMeasurementHistory() {
        //TODO: fetch actual entries form DB.
        measurementHistory = [MeasurementEntry](repeating: .stub, count: 10)
    }
}

// MARK: - Protocols
//=============================

protocol WeightFacadable {
    var measurementHistory: [MeasurementEntry] {get}
    func measure(weight: Weight)
}

