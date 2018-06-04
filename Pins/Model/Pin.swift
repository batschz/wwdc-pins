//
//  Pin.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import FirebaseFirestore

struct Pin {
    let name: String
    let url: URL
    
    init?(snapshot: DocumentSnapshot) {
        guard let data = snapshot.data() else {
            return nil
        }
        guard let path = data["url"] as? String else {
                return nil
        }
        
        guard let url = URL(string: path) else {
            return nil
        }
        
        self.name = snapshot.documentID
        self.url = url
    }
}
