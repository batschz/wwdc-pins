//
//  Message.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

struct Message {
    let sender: String
    let content: String
    let createdAt: Date
    
    init?(snapshot: DocumentSnapshot) {
        
        guard let data = snapshot.data() else {
            return nil
        }

        guard let sender = data["sender"] as? String,
            let createdAt = data["createdAt"] as? Timestamp,
            let content = data["content"] as? String else {
                return nil
        }
        
        self.sender = sender
        self.createdAt = createdAt.dateValue()
        self.content = content
    }
}
