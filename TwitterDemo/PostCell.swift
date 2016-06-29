//
//  PostCell.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/28/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    var tweet: Tweet?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
