//
//  Constants.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import Foundation

struct Constants {
    
    static let shared = Constants()
    
    enum error: String {
        case loginError = "Incorrect email / password."
        case apiError = "Sorry, there is an issue connecting to the database."
    }
    
}
