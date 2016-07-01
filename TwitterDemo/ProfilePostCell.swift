//
//  ProfilePostCell.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/30/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class ProfilePostCell: UITableViewCell {

    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
