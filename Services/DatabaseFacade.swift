//
//  DatabaseFacade.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 04/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import CoreData


protocol DatabaseFacadable{
    
    func create(person: Person) throws
    func retrieve(userName: String) -> Person?
    func retrieveAll() -> [Person]
    func update(person: Person) throws
    func delete(userName: String) throws
    
    func create(measurement: MeasurementEntry) throws
    func retrieve(date: Date) -> MeasurementEntry?
    func retrieveAll() -> [MeasurementEntry]
    func update(measurementEntry: MeasurementEntry) throws
    func delete(date: Date) throws
}

class DatabaseFacade: DatabaseFacadable {
    
    // MARK: - Properties
    //=============================

    private let coreDataStack: CoreDataLogic

    
    // MARK: - Initializer
    //=============================
    
    //Dependency Injection
    init(coreDataLogic: CoreDataLogic) {
        self.coreDataStack = coreDataLogic
    }

    
    // MARK: - Methods
    //=============================

    func create(person: Person) throws {
        try coreDataStack.create(person: person)
    }
    
    func retrieve(userName: String) -> Person? {
        return coreDataStack.retrieve(userName: userName)
    }
    
    func retrieveAll() -> [Person] {
        return coreDataStack.retrieveAll()
    }
    
    func update(person: Person) throws {
        try coreDataStack.update(person: person)
    }
    
    func delete(userName: String) throws {
        try coreDataStack.delete(userName: userName)
    }
    
    func create(measurement: MeasurementEntry) throws {
        try coreDataStack.create(measurement: measurement)
    }
    
    func retrieve(date: Date) -> MeasurementEntry? {
        return coreDataStack.retrieve(date: date)
    }
    
    func retrieveAll() -> [MeasurementEntry] {
        return coreDataStack.retrieveAll()
    }
    
    func update(measurementEntry: MeasurementEntry) throws {
        try coreDataStack.update(measurementEntry: measurementEntry)
    }
    
    func delete(date: Date) throws {
        try coreDataStack.delete(date: date)
    }
    
    
    
}
