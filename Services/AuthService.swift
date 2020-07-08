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
   
    //TODO: Handle threading 
    var user: Person?
    typealias username = String
    
    func signIn(email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: {
            result, error in
            if let error = error {
                print("Error! description: \(error.localizedDescription)")
                return
            } else {
                if let result = result {
                    print("Success!, \(result.user.displayName)")
                    completion(result.user)
                }
            }
        })
    }
    //TODO: Add error descriptions for each individual error(email in use etc.)
    func signUp(email: String, password: String, completion: @escaping (User?) -> Void) {
        
        if email.isEmpty || password.isEmpty {
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
            
            // Change the display name in firebase to match the specified username
            
//            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
//            changeRequest?.displayName = username
//            changeRequest?.commitChanges(completion: {
//                error in
//                if let error = error{
//                    print("Error! description: \(error.localizedDescription)")
//                    return
//                }
//            })
        }
        //TODO: Add username to the user's account
//        completion(user?.userName)
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
    
    private func errorHandler() {
        //TODO: Add error handling with firebase error codes.
    }

}

protocol AuthServicable {
    
    var user: Person? { get}
    
    func signIn(email: String, password: String, completion: @escaping (User?) -> Void)
    func signUp(email: String, password: String, completion: @escaping (User?) -> Void)
    func signOut()
    func editUserDetails()
    func deleteUserAccount()
    func resetUserPassword(with email: String)

}




