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
    
    private let databaseFacade: DatabaseFacade

    var measurementHistory: [MeasurementEntry] = []
    
//    public static let stub = WeightFacade()

    // MARK: - Initializer
    //=============================

    init(databaseFacade: DatabaseFacade) {
        self.databaseFacade = databaseFacade
        fetchMeasurementHistory()
    }
    
    
    // MARK: - Methods
    //=============================
    
    func createPerson(username: String, startingWeight: Weight) {
        let person = Person(weight: startingWeight, userName: username)
        try? databaseFacade.create(person: person)
    }

    func measure(weight: Weight) {
        measurementHistory.append(MeasurementEntry(weight: weight, date: Date()))
        let measurement = MeasurementEntry(weight: weight, date: Date())
        try? databaseFacade.create(measurement: measurement)
    }
    
    func editEntry(date: Date, weight: Weight) throws {
        //TODO: Edit an entry in the database.
        if var entry: MeasurementEntry = databaseFacade.retrieve(date: date) {
            entry.weight = weight
            try? databaseFacade.update(measurementEntry: entry)
        }
    }
    
    func deleteEntry(date: Date) {
        // TODO: Delete a requested entry from the database.
        try? databaseFacade.delete(date: date)
    }
    
    func fetchMeasurementHistory() {
        //TODO: fetch actual entries form DB.
        let measurements: [MeasurementEntry] = databaseFacade.retrieveAll()
        if measurements.count != 0 {
            measurementHistory.append(contentsOf: measurements)
        } else {
            print("fetchMeasurementHistory: Failed to fetch data, check if the data exists.")
//            measurementHistory = [MeasurementEntry](repeating: .stub, count: 20)
        }
    }
}

// MARK: - Protocols
//=============================

protocol WeightFacadable {
    var measurementHistory: [MeasurementEntry] {get}
    func measure(weight: Weight)
    func createPerson(username: String, startingWeight: Weight)
    func fetchMeasurementHistory()
    func deleteEntry(date: Date)
    func editEntry(date: Date, weight: Weight) throws
}

