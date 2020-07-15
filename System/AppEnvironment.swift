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
    let authService: AuthServicable
    
    init(databaseFacade: DatabaseFacadable,
         weightFacade: WeightFacadable,
         coreDataLogic: CoreDataLogic,
         authService: AuthServicable) {
        
        self.databaseFacade = databaseFacade
        self.weightFacade = weightFacade
        self.coreDataLogic = coreDataLogic
        self.authService = authService
    }
    
}

extension AppEnvironment {
    
    //TODO: Ask Dan if databaseFacade's initialization should be different
    public static func bootstrap() -> AppEnvironment {
        let stack = CoreDataStack(modelName: "WeightTracker")
        let databaseFacade = DatabaseFacade(coreDataLogic: stack)
        let authenticationFacade = AuthService(databaseFacade: databaseFacade)
        let weightFacade = WeightFacade(databaseFacade: databaseFacade, authFacade: authenticationFacade)
        return AppEnvironment(databaseFacade: databaseFacade, weightFacade: weightFacade, coreDataLogic: stack, authService: authenticationFacade)
    }
}
