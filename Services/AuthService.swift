//
//  AuthService.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 19/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService: AuthServicable {
    
    // MARK: - Properties
    //=============================

    private let databaseFacade: DatabaseFacadable
    
    var user: Person?
    var isLoggedIn: Bool {
        return user != nil
    }

    // MARK: - Life Cycle
    //=============================

    init(databaseFacade: DatabaseFacadable) {
        self.databaseFacade = databaseFacade
    }
    
    // MARK: - Methods
    //=============================

    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user{
                guard let email = user.email else {
                    self.signOut()
                    return
                }
                if let domainUser = self.databaseFacade.retrieve(userName: email){
                    self.user = domainUser
                } else {
                    let domainUser = Person(weight: -1, userName: email, startingWeight: -1, goalWeight: -1)
                    do {
                        try self.databaseFacade.create(person: domainUser)
                        self.user = domainUser
                    } catch {
                        print("Nothing saved")
                        //TODO: Handle issue
                    }
                }
                
                print("A user is already logged in with email \(user.email)")
                NotificationCenter.default.post(name: .UserLoggedIn, object: nil)
            } else {
                self.user = nil
                print("There is no user logged in")
                NotificationCenter.default.post(name: .UserLoggedOut, object: nil)
                
            }
        }
    }
    
    typealias username = String

    func signIn(email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: {
            result, error in
            if let error = error {
                print("Error! description: \(error.localizedDescription)")
                completion(nil)
                return
            } else {
                if let result = result {
                    print("Success!, \(result.user.displayName)")
                }
            }
        })
    }

    //TODO: Add error descriptions for each individual error(email in use etc.)
    func signUp(email: String, password: String, username: String, completion: @escaping (User?) -> Void) {
        
        if email.isEmpty || password.isEmpty || username.isEmpty{
            return
        } else {
            Auth.auth().createUser(withEmail: email, password: password, completion: {
                result, error in
                //TODO: Fix this!
                guard let user = result?.user, error == nil else {
                    print("Error! description: \(error?.localizedDescription)")
                    return
                }
                print("\(user.email) created!")
                completion(result?.user)
            })
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
        } catch let error as NSError {
            print("Fetch error: \(error), Description: \(error.userInfo)")
        }
    }
    
    func resetUserPassword(with email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error  {
                print("Error! description: \(error.localizedDescription)")
            }
        }
    }
    
    func editUserDetails() {
        //TODO: Add edit options for the user
    }
    
    func deleteUserAccount() {
        let user = Auth.auth().currentUser
        user?.delete(completion: { (error) in
            if let error = error {
                print("Error! description: \(error.localizedDescription)")
            } else {
                print("User deleted")
            }
        })
    }
    //TODO: Add error handling with firebase error codes.
}

// MARK: - Protocol
//=============================

protocol AuthServicable {
    
    var user: Person? { get}
    var isLoggedIn: Bool { get }
    
    func signIn(email: String, password: String, completion: @escaping (User?) -> Void)
    func signUp(email: String, password: String, username: String, completion: @escaping (User?) -> Void)
    func signOut()
    func editUserDetails()
    func deleteUserAccount()
    func resetUserPassword(with email: String)
    func listenToAuthState()
    
}




