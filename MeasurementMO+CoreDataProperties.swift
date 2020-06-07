//
//  MeasurementMO+CoreDataProperties.swift
//  
//
//  Created by Yohai Reshef on 07/06/2020.
//
//

import Foundation
import CoreData


extension MeasurementMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeasurementMO> {
        return NSFetchRequest<MeasurementMO>(entityName: "MeasurementMO")
    }

    @NSManaged public var date: Date?
    @NSManaged public var weight: Float
    @NSManaged public var person: PersonMO?

}
