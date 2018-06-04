//
//  Message.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

struct Message {
    let uid: String
    let sentBy: String
    let content: String
    let createdAt: Date
    
    init?(snapshot: DocumentSnapshot) {
        
        guard let data = snapshot.data() else {
            return nil
        }

        print (data)
        guard let sentBy = data["sentBy"] as? String,
            let createdAt = data["createdAt"] as? Date,
            let content = data["content"] as? String else {
                return nil
        }
        
        self.uid = snapshot.documentID
        self.sentBy = sentBy
        self.createdAt = createdAt
        self.content = content
    }
}
