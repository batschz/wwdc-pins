//
//  AppDelegate.swift
//  Pins
//
//  Created by Werner Huber on 03.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        UserService().signin()
        UserService().stream { users in
            //print (users)
        }
        PinService().availablePins { pins in
            print (pins)
        }
        ConversationService().conversationWith(user: "franz") { conversation in
            print (conversation)
        }

        if UserDefaults().bool(forKey: "isSignedUp") {
            showTradesViewController()
        }
        return true
    }

    func showTradesViewController() {
        window?.rootViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TradesNavigationController")
    }


}

