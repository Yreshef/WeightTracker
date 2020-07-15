//
//  PersonMO+CoreDataProperties.swift
//  
//
//  Created by Yohai Reshef on 07/06/2020.
//
//

import Foundation
import CoreData


extension PersonMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonMO> {
        return NSFetchRequest<PersonMO>(entityName: "PersonMO")
    }

    @NSManaged public var userName: String?
    @NSManaged public var weight: Float
    @NSManaged public var startingWeight: Float
    @NSManaged public var goalWeight: Float
    @NSManaged public var measurementHistory: NSOrderedSet?

}

// MARK: Generated accessors for measurementHistory
extension PersonMO {

    @objc(insertObject:inMeasurementHistoryAtIndex:)
    @NSManaged public func insertIntoMeasurementHistory(_ value: MeasurementMO, at idx: Int)

    @objc(removeObjectFromMeasurementHistoryAtIndex:)
    @NSManaged public func removeFromMeasurementHistory(at idx: Int)

    @objc(insertMeasurementHistory:atIndexes:)
    @NSManaged public func insertIntoMeasurementHistory(_ values: [MeasurementMO], at indexes: NSIndexSet)

    @objc(removeMeasurementHistoryAtIndexes:)
    @NSManaged public func removeFromMeasurementHistory(at indexes: NSIndexSet)

    @objc(replaceObjectInMeasurementHistoryAtIndex:withObject:)
    @NSManaged public func replaceMeasurementHistory(at idx: Int, with value: MeasurementMO)

    @objc(replaceMeasurementHistoryAtIndexes:withMeasurementHistory:)
    @NSManaged public func replaceMeasurementHistory(at indexes: NSIndexSet, with values: [MeasurementMO])

    @objc(addMeasurementHistoryObject:)
    @NSManaged public func addToMeasurementHistory(_ value: MeasurementMO)

    @objc(removeMeasurementHistoryObject:)
    @NSManaged public func removeFromMeasurementHistory(_ value: MeasurementMO)

    @objc(addMeasurementHistory:)
    @NSManaged public func addToMeasurementHistory(_ values: NSOrderedSet)

    @objc(removeMeasurementHistory:)
    @NSManaged public func removeFromMeasurementHistory(_ values: NSOrderedSet)

}
