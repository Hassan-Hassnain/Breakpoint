//
//  AuthService.swift
//  Breakpoint
//
//  Created by Usama Sadiq on 2/24/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) ->  ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (AuthResult, error) in
            guard let user = AuthResult?.user, error == nil else { userCreationComplete(false, error); return }
            
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true,nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (AuthResult, error) in
            guard let  user = AuthResult?.user else {
                loginComplete(false, error!)
                return
            }
            loginComplete(true, nil)
        }
        
    }
    
    
}
