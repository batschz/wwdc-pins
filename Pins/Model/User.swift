//
//  User.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

struct User {
    let username: String
    let updateAt: Date
    let offers: [String]
    let wants: [String]
    
    init?(snapshot: DocumentSnapshot) {
        guard let data = snapshot.data() else {
            return nil
        }
        guard let username = data["username"] as? String,
            let updateAt = data["updatedAt"] as? Date,
            let offers = data["offers"] as? [String: Bool],
            let wants = data["wants"] as? [String: Bool] else {
                return nil
        }
        
        self.offers = offers.filter { (key, value) -> Bool in
            return value
            }.map { (key, value) -> String in
                return key
        }
        
        self.wants = wants.filter { (key, value) -> Bool in
            return value
            }.map { (key, value) -> String in
                return key
        }
 
        self.username = username
        self.updateAt = updateAt
    }
    
}
