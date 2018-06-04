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
    
    class func signin() {
        Auth.auth().signInAnonymously(completion: nil)
    }
    
    class func stream() {
        
        
        
    }
    
}
