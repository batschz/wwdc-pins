//
//  ConversationService.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseAuth
import FirebaseFirestore

class ConversationService {
    
    let db = Firestore.firestore()
    
    init() {
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
    func conversationWith(user: String, completion: @escaping (Conversation?) -> ()) {
        guard let me = Auth.auth().currentUser else {
            completion(nil)
            return
        }
        db.collection("conversations")
            .whereField("participants.\(me.uid)", isEqualTo: true)
            .whereField("participants.\(user)", isEqualTo: true).addSnapshotListener { (snapshot, error) in
                guard let document = snapshot?.documents.first else {
                    completion(nil)
                    return
                }
                let conversation = Conversation(snapshot: document)
                completion(conversation)
        }
    }
    
    func startConversationWith(user: String, completion: @escaping (Conversation?) -> ()) {
        guard let me = Auth.auth().currentUser else {
            completion(nil)
            return
        }
        let document = db.collection("conversations").document()
        document.setData(["participants": [user: true, me.uid: true]]) { error in
            guard error == nil else {
                completion(nil)
                return
            }
            let conversation = Conversation(conversationId: document.documentID, sender: me.uid, receiver: user)
            completion(conversation)
        }
    }
    
    func messagesOf(conversation: Conversation, completion: @escaping ([Message]) -> ()) {
        db.collection("conversations").document(conversation.conversationId).collection("messages").order(by: "createdAt").addSnapshotListener { (snapshot, error) in
            
            guard let snapshot = snapshot else {
                completion([])
                return
            }
            var messages: [Message] = []
            snapshot.documents.forEach({ documentSnapshot in
                if let message = Message(snapshot: documentSnapshot) {
                    messages.append(message)
                }
            })
            completion(messages)
        }
    }
    
    func send(message: String, inConversation conversation: Conversation, completion: @escaping (Bool) -> ()) {
        guard let me = Auth.auth().currentUser else {
            completion(false)
            return
        }
        let document = db.collection("conversations").document(conversation.conversationId).collection("messages").document()
        document.setData(["sentBy": me.uid, "content": message, "createdAt": FieldValue.serverTimestamp()]) { error in
            completion(error == nil)
        }
        
    }
    
}
