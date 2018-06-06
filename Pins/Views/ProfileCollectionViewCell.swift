//
//  ProfileCollectionViewCell.swift
//  Pins
//
//  Created by Werner Huber on 05.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pinImageView: UIImageView!
    
    var dataTask: URLSessionDataTask?
    
    var pin: Pin? {
        didSet {
            guard let url = pin?.url else {
                return
            }
            dataTask?.cancel()
            dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    guard let data = data else {
                        return
                    }
                    print (url)
                    self.pinImageView.image = UIImage(data: data)
                })
            })
            dataTask?.resume()
        }
    }
    
}
