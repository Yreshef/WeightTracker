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
    
    // MARK: - Person helper methods
    //==============================

    
    private func fetchPersonRequest(predicate: NSPredicate? = nil)
        -> NSFetchRequest<PersonMO> {
        let request: NSFetchRequest<PersonMO> = PersonMO.fetchRequest()
        request.predicate = predicate
        return request
    }
    
    private func convert(personMO: PersonMO) -> Person? {
        guard let userName = personMO.userName else{
            return nil
        }
        let person = Person(weight: personMO.weight, userName: userName)
        return person
    }
    
    private func convert(person: Person) -> PersonMO {
        let personMO = PersonMO(context: managedContext)
        personMO.weight = person.weight
        personMO.userName = person.userName
        return personMO
    }
    
    private func retrievePersonMO(userName: String) -> PersonMO? {
        let predicate = NSPredicate(format: "userName == %@", userName)
        let request = fetchPersonRequest(predicate: predicate)
        if let result = try? managedContext.fetch(request).first{
            return result
        }
        return nil
    }
    
    private func retrieveAllPersonMO() -> [PersonMO] {
        let request = fetchPersonRequest()
        if let results = try? managedContext.fetch(request) {
            return results
        }
        return []
    }
    
    
    // MARK: - Measurement helper methods
    //===================================

    private func fetchMeasurementRequest(predicate: NSPredicate? = nil) ->
        NSFetchRequest<MeasurementMO>{
            let request: NSFetchRequest<MeasurementMO> = MeasurementMO
                .fetchRequest()
            request.predicate = predicate
            return request
    }
    
    private func convert(measurement: MeasurementEntry) -> MeasurementMO {
        let measurementMO = MeasurementMO(context: managedContext)
        measurementMO.weight = measurement.weight
        measurementMO.date = measurement.date
        return measurementMO
    }
    
    private func convert(measurmentMO: MeasurementMO) -> MeasurementEntry? {
        guard let date = measurmentMO.date else {
            return nil
        }
        let entry = MeasurementEntry(weight: measurmentMO.weight,
                                     date: date)
        return entry
    }
    
    private func retrieveMeasurementMO(date: Date) -> MeasurementMO? {
        let predicate = NSPredicate(format: "date == %@", date
            .getInEuropeanDateFormat()!) //TODO: fix!
        let request = fetchMeasurementRequest(predicate: predicate)
        if let result = try? managedContext.fetch(request).first {
            return result
        }
        return nil
    }
    
    private func retrieveAllMeasurementMO() -> [MeasurementMO] {
        let request = fetchMeasurementRequest()
        if let results = try? managedContext.fetch(request) {
            return results
        }
        return []
    }
}

// MARK: - Protocol Implementation
//================================

extension CoreDataStack {
    
    func create(person: Person) throws {
        let personMO = convert(person: person)
        try saveContext()
        
        //TODO: return the person
    }
    
    func retrieve(userName: String) -> Person? {
        if let personMO = retrievePersonMO(userName: userName) {
            return convert(personMO: personMO)
        }
        return nil
    }
    
    func retrieveAll() -> [Person] {
        let results = retrieveAllPersonMO()
        return results.compactMap {
                convert(personMO: $0)
        }
    }
    
    func update(person: Person) throws {
        guard let personMO = retrievePersonMO(userName: person.userName) else {
            throw CoreDataError.notFound
        }
        personMO.weight = person.weight
        try saveContext()
    }
    
    func delete(userName: String) throws {
        //check if user exists
        guard let personMO = retrievePersonMO(userName: userName) else {
            throw CoreDataError.notFound
        }
        //delete it if it does
        managedContext.delete(personMO)
        try saveContext()
    }
    
    func create(measurement: MeasurementEntry) throws {
        let measurementMO = convert(measurement: measurement)
        try saveContext()
        
        //TODO: return the entry
    }
    
    func retrieve(date: Date) -> MeasurementEntry? {
        if let measurementMO = retrieveMeasurementMO(date: date){
            return convert(measurmentMO: measurementMO)
        }
        return nil
    }
    
    func retrieveAll() -> [MeasurementEntry] {
        let results = retrieveAllMeasurementMO()
        return results.compactMap {
                convert(measurmentMO: $0)
        }
    }
    
    func update(measurementEntry: MeasurementEntry) throws {
        guard let measurementMO = retrieveMeasurementMO(date: measurementEntry.date) else {
            throw CoreDataError.notFound
        }
        measurementMO.weight = measurementEntry.weight
        measurementMO.date = measurementEntry.date
        
        try saveContext()
        
    }
    
    func delete(date: Date) throws {
        guard let measurementMO = retrieveMeasurementMO(date: date) else {
            throw CoreDataError.notFound
        }
        managedContext.delete(measurementMO)
        try saveContext()
    }
}

protocol CoreDataLogic{
    
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

enum CoreDataError: LocalizedError {
    
    case noChanges, notFound
    var errorDescription: String?{
        switch self {
        case .noChanges:
            return "No changes detected"
        case .notFound:
            return "The entry was not found"
        }
    }
}

extension NSManagedObjectContext {
    func deleteAllData()
    {
        guard let persistentStore = persistentStoreCoordinator?.persistentStores.last else {
            return
        }
        
        guard let url = persistentStoreCoordinator?.url(for: persistentStore) else {
            return
        }
        
        performAndWait { () -> Void in
            self.reset()
            do
            {
                try self.persistentStoreCoordinator?.remove(persistentStore)
                try FileManager.default.removeItem(at: url)
                try self.persistentStoreCoordinator?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
            }
            catch { /*dealing with errors up to the usage*/ }
        }
    }
}
