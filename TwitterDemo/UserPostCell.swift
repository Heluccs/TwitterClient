//
//  UserPostCell.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 7/1/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class UserPostCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var timestamp: UILabel!

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var tweetPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
