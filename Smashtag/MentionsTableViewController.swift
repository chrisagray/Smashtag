//
//  MentionsTableViewController.swift
//  Smashtag
//
//  Created by Chris Gray on 9/29/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit
import Twitter

class MentionsTableViewController: UITableViewController {
    
    //    all mentions have a prefix of @, #, or http
    //    all images are media items
    
    var mentionDict = [String: AnyObject]() //String: Mention or MediaItem
    
    private var mentionNames : [String] {
        //        ["URLs", "Images", "Hashtags", "Screen Names"]
        return [String](mentionDict.keys)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //        if !images.isEmpty {
        //            for image in images {
        //                fetchImage(image)
        //            }
        //        }
        
    }
    
    //    private var imageView = UIImageView()
    //
    //    private var image : UIImage? {
    //        get {
    //            return imageView.image
    //        }
    //        set {
    //            imageView.image = newValue
    //            imageView.sizeToFit()
    //        }
    //    }
    
    //    private func fetchImage(image: MediaItem) -> UIImage {
    //        let url = image.url
    //        var newImage = UIImage()
    //
    //        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
    //            let contentsOfURL = NSData(contentsOfURL: url)
    //            dispatch_async(dispatch_get_main_queue()) {
    //                if let imageData = contentsOfURL {
    //                    newImage = UIImage(data: imageData)!
    //                }
    //            }
    //        }
    //        return newImage
    //    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //        images and three mentions
        return mentionDict.count
    }
    //
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentionDict[mentionNames[section]]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Mention"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MentionsTableViewCell
        
        //        let mention = mentions[indexPath.section][indexPath.row]
        
        let mentionTitle = mentionNames[indexPath.section]
        
        let mention = mentionDict[mentionTitle]![indexPath.row]
        
        cell.mention = mention
//        cell.textLabel?.text = mentionTitle
        
        //        cell.mentionsImageView.image = fetchImage(imageMediaItem)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if mentionDict[mentionNames[section]]?.count != 0 {
            return mentionNames[section]
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let sectionHeader = mentionNames[indexPath.section]
        let mentionArray = mentionDict[sectionHeader]
        
        let mention = mentionArray?[indexPath.item]
        let itemTitle = mention?.keyword
        
        if indexPath.section == 0 { //urls
            if let url = NSURL(string: itemTitle!) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Mention" {
            if let mentionCell = sender as? MentionsTableViewCell {
                if let mention = mentionCell.mention {
                    if let tweetVC = segue.destinationViewController as? TweetTableViewController {
                        tweetVC.searchText = mention.keyword
                    }
                }
            }
        }
    }
}















