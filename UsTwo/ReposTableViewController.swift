//
//  ReposTableViewController.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/20/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getRepositoriesWithCompletion {
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        let repository:GithubRepository = store.repositories[indexPath.row]
        cell.textLabel?.text = repository.fullName
        return cell
    }
   
}
