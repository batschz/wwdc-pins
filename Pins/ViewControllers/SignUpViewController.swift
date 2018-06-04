//
//  SignUpViewController.swift
//  Pins
//
//  Created by franz busch on 04.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet private var nameTextField: UITextField!

    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text else {
            return
        }

        UserService().save(username: name) { success in
            if success {
                (UIApplication.shared.delegate as? AppDelegate)?.showTradesViewController()
            }
        }
    }

}

