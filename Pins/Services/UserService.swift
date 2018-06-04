//
//  UserService.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseAuth
import FirebaseFirestore

class UserService {
    
    func signin() {
        Auth.auth().signInAnonymously(completion: nil)
    }
    
    func save(username: String, completion: @escaping (Error?) -> ()) {
        let db = Firestore.firestore()
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        db.collection("users").document(user.uid).setData(["username": username], merge: true) { error in
            completion(error)
        }
        
    }
    
    func stream(completion: @escaping ([User]) -> ()) {
        
        let db = Firestore.firestore()
        db.collection("users").order(by: "updatedAt").addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else {
                return
            }
            var users: [User] = []
            snapshot.documents.forEach({ documentSnapshot in
                if let user = User(snapshot: documentSnapshot) {
                    users.append(user)
                }
            })
            completion(users)
        }
        
    }
    
    func save(wants: [String: Bool], needs: [String: Bool]) {
        
        let db = Firestore.firestore()
        guard let user = Auth.auth().currentUser else {
            return
        }
        db.document(user.uid).setData(["wants": wants, "needs": needs, "updatedAt": FieldValue.serverTimestamp()], merge: true)
    }
    
}
