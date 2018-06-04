//
//  TradeTableViewCell.swift
//  Pins
//
//  Created by franz busch on 04.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit

class TradesTableViewCell: UITableViewCell {


    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var offersStackView: UIStackView!
    @IBOutlet private var wantsStackView: UIStackView!

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }

    var offerImages =  [UIImage]() {
        didSet {
            insert(offerImages, into: offersStackView)
        }
    }

    var wantsImages =  [UIImage]() {
        didSet {
            insert(wantsImages, into: wantsStackView)
        }
    }

    @IBAction private func messageButtonTapped(_ sender: UIButton) {

    }

    private func insert(_ images: [UIImage], into stackView: UIStackView) {
        stackView.subviews.forEach { $0.removeFromSuperview() }
        images.forEach {
            let imageView = UIImageView()
            imageView.image = $0
            stackView.addArrangedSubview(imageView)
        }

        stackView.addArrangedSubview(UIView())
    }
    
}
