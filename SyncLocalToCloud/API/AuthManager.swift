//
//  AuthManager.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import Foundation
import Firebase

struct AuthManager {
    
    static let shared = AuthManager()
    
    func logInUser(withEmail email: String, withPassword password: String, completion: AuthDataResultCallback?) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
}


