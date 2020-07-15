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

    
    private let databaseFacade: DatabaseFacadable
    private let authFacade: AuthServicable
    
    private var user: Person? {
        return authFacade.user
    }

    var measurementHistory: [MeasurementEntry] = []

    
//    public static let stub = WeightFacade()

    // MARK: - Initializer
    //=============================

    init(databaseFacade: DatabaseFacadable, authFacade: AuthServicable) {
        self.databaseFacade = databaseFacade
        self.authFacade = authFacade
        fetchMeasurementHistory()
    }
    
    
    // MARK: - Methods
    //=============================
    
    func createPerson(username: String, startingWeight: Weight, goalWeight: Weight) -> Person? {
        let person = Person(weight: startingWeight, userName: username, startingWeight: startingWeight, goalWeight: goalWeight)
        return try? databaseFacade.create(person: person)
    }

    func measure(weight: Weight) {
        measurementHistory.append(MeasurementEntry(weight: weight, date: Date()))
        let measurement = MeasurementEntry(weight: weight, date: Date())
        try? databaseFacade.create(measurement: measurement)
        NotificationCenter.default.post(name: .MeasurementDidChange, object: nil)
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
        let measurements: [MeasurementEntry] = databaseFacade.retrieveAll()
        if measurements.count != 0 {
            measurementHistory.append(contentsOf: measurements)
        } else {
            print("fetchMeasurementHistory: Failed to fetch data, check if the data exists.")
        }
    }
}

// MARK: - Protocols
//=============================

protocol WeightFacadable {
    var measurementHistory: [MeasurementEntry] {get}
    func measure(weight: Weight)
    func createPerson(username: String, startingWeight: Weight, goalWeight: Weight) -> Person?
    func fetchMeasurementHistory()
    func deleteEntry(date: Date)
    func editEntry(date: Date, weight: Weight) throws
}

