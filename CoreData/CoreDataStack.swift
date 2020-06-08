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
}

// MARK: - Protocol Implementation
//================================

extension CoreDataStack {
    
    func create(person: Person) throws {
        let personMO = convert(person: person)
        try saveContext()
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
