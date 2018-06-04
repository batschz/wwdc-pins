//
//  TradesViewController.swift
//  Pins
//
//  Created by franz busch on 04.06.18.
//  Copyright © 2018 Werner Huber. All rights reserved.
//

import UIKit

class TradesViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!



}

// MARK: UITableViewDatasource
extension TradesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
