//
//  Message.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

struct Conversation {
    let conversationId: String
    let participants: [String]
    
    init?(snapshot: DocumentSnapshot) {
        guard let data = snapshot.data() else {
            return nil
        }
        guard let participants = data["participants"] as? [String: Bool] else {
                return nil
        }
        self.participants = participants.map { (key, value) -> String in
                return key
        }
        self.conversationId = snapshot.documentID
    }
    
    init(conversationId: String, sender: String, receiver: String) {
        self.conversationId = conversationId
        participants = [sender, receiver]
    }
    
}
