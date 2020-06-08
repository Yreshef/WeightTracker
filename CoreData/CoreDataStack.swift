//
//  CoreDataService.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 04/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: CoreDataLogic{
    
    // MARK: - Properties
    //=============================

    private let modelName: String
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores {
            (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    // MARK: - Initalizer
    //=============================

    init(modelName: String) {
        self.modelName = modelName
    }

    // MARK: - Methods
    //=============================

    private func saveContext() throws {
        guard managedContext.hasChanges else {
            throw CoreDataError.noChanges
        }
        try managedContext.save()
    }
    
    private func fetchPerson() {
        
    }
    
    private func fetchPersonRequest(predicate: NSPredicate? = nil)
        -> NSFetchRequest<PersonMO> {
        let request: NSFetchRequest<PersonMO> = PersonMO.fetchRequest()
        request.predicate = predicate
        return request
    }
}

// MARK: - Protocol Implementation
//================================

extension CoreDataStack {
    
    func create(person: Person) throws {
        let personMO = PersonMO(context: managedContext)
        personMO.weight = person.weight
        personMO.userName = person.userName
        personMO.measurementHistory = []
        try saveContext()
    }
    
    func retrieve(userName: String) -> Person? {
        //TODO: implement
        return nil
    }
    func retrieveAll() -> [Person] {
        //TODO: implement
        return []
    }
    func update(person: Person) throws {
        //TODO: implement
    }
    func delete(userName: String) throws {
        //TODO: implement
    }
    func create(measurement: MeasurementEntry) throws {
        //TODO: implement
    }
    func retrieve(day: Int, month: Int, year: Int) -> MeasurementEntry? {
        //TODO: implement
        return nil
    }
    func retrieveAll() -> [MeasurementEntry] {
        //TODO: implement
        return []
    }
    func update(measurementEntry: MeasurementEntry) throws {
        //TODO: implement
    }
    func delete(date: Date) throws {
        //TODO: implement
    }
}

protocol CoreDataLogic{
    
    func create(person: Person) throws
    func retrieve(userName: String) -> Person?
    func retrieveAll() -> [Person]
    func update(person: Person) throws
    func delete(userName: String) throws
    
    func create(measurement: MeasurementEntry) throws
    func retrieve(day: Int, month: Int, year: Int) -> MeasurementEntry?
    func retrieveAll() -> [MeasurementEntry]
    func update(measurementEntry: MeasurementEntry) throws
    func delete(date: Date) throws
}

enum CoreDataError: LocalizedError {
    
    case noChanges
    var errorDescription: String?{
        switch self {
        case .noChanges:
            return "No changes detected"
        }
    }
}
