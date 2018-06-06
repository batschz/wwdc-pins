//
//  ProfileViewController.swift
//  Pins
//
//  Created by Werner Huber on 05.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    let pinService = PinService()
    var pins = [Pin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinService.availablePins { pins in
            self.pins = pins
            self.collectionView.reloadData()
        }
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        cell.pin = pins[indexPath.row]
        return cell
    }
    
    
}
