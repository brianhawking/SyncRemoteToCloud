//
//  DataManager.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import Foundation
import Firebase

struct Letter: Codable {
    let id: String
    let recipient: String
    let author: String
    let authorType: String
    let content: String
    let unread: Bool
    let date: Date
}

struct DataManager {
    
    static let shared = DataManager()
    
    func sync() {
        
        // check if database exists for this email address
        
        // 
        
    }
    
    func upload() {
        
        // path to folder
        
        let path = FileManager.default.urls(for: .documentDirectory, in:
                                                    .userDomainMask)[0]
        
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: .none, options: .skipsHiddenFiles)
            
            for entry in directoryContents {
                
                
                do {
                    let data = try Data(contentsOf: entry)
                    let jsonResult = try JSONDecoder().decode(Letter.self, from: data)
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    
                    guard let result = json else {return}
                    
                    let ref = Database.database().reference()
                    ref.child("Some Account").child(jsonResult.author).child("LettersToSanta").child(jsonResult.id).setValue(result)

                    
                }
                
            }
            
        } catch {
            print(error)
        }
        
        
    }
    
    func download() {
        let ref = Database.database().reference()
        let data = ref.child("Some Account").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.value)
        }
    }
    
}
