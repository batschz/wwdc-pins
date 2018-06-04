//
//  PinService.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

class PinService {
    
    func availablePins(completion: @escaping ([Pin]) -> ()) {
        let db = Firestore.firestore()
        db.collection("pins").addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else {
                return
            }
            var pins: [Pin] = []
            snapshot.documents.forEach({ documentSnapshot in
                if let pin = Pin(snapshot: documentSnapshot) {
                    pins.append(pin)
                }
            })
            completion(pins)
        }
    }
}