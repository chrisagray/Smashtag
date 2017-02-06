//
//  RecentTweetsTableViewController.swift
//  Smashtag
//
//  Created by Chris Gray on 10/10/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit
import Twitter

class RecentSearchesTableViewController: UITableViewController {
    
    private var recents: [String] { get { return RecentSearches().searches } }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recents.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Search", forIndexPath: indexPath)

        let cellTitle = recents[indexPath.row]
        
        cell.textLabel?.text = cellTitle

        return cell
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SearchTerm" {
            if let tweetVC = segue.destinationViewController as? TweetTableViewController {
                if let cell = sender as? UITableViewCell {
                    tweetVC.searchText = cell.textLabel!.text
                }
            }
        }
    }
}
