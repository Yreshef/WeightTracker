//
//  AppEnvironment.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 07/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation

class AppEnvironment {
    
    let databaseFacade: DatabaseFacadable
    let weightFacade: WeightFacadable
    let coreDataLogic: CoreDataLogic
    
    init(databaseFacade: DatabaseFacadable,
         weightFacade: WeightFacadable,
         coreDataLogic: CoreDataLogic) {
        
        self.databaseFacade = databaseFacade
        self.weightFacade = weightFacade
        self.coreDataLogic = coreDataLogic
    }
    
}

extension AppEnvironment {
    
    public static func bootstrap() -> AppEnvironment {
        let stack = CoreDataStack(modelName: "WeightTracker")
        return AppEnvironment(databaseFacade: DatabaseFacade(coreDataLogic: stack),
                              weightFacade: WeightFacade(),
                              coreDataLogic: stack)
    }
}
