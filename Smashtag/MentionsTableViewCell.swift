//
//  MentionsTableViewCell.swift
//  Smashtag
//
//  Created by Chris Gray on 9/29/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import UIKit
import Twitter

class MentionsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var mentionTextLabel: UILabel!
    
    var mention : AnyObject? {
        didSet {
            updateUI()
        }
    }
    
    
    private func updateUI() {
        //        mentionTextLabel.attributedText = nil
        if let mention = self.mention {
            mentionTextLabel.text = mention.keyword
        }
    }
    
}
