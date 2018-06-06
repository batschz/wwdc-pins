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
    
    let userService = UserService()
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        userService.stream { users in
            self.users = users
            self.tableView.reloadData()
        }
        performSegue(withIdentifier: "ProfileViewController", sender: nil)
    }

}

// MARK: UITableViewDatasource
extension TradesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TradesTableViewCell", for: indexPath) as! TradesTableViewCell
        cell.user = users[indexPath.row]
        cell.delegate = self
        return cell
    }

}

extension TradesViewController: TradesTableViewCellDelegate {
    func didTapMessage(cell: TradesTableViewCell) {
        performSegue(withIdentifier: "ConversationViewController", sender: nil)
    }
}
