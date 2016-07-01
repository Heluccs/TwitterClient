//
//  PostCell.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/28/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
   // var delegate: myCellDelegator!

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    var tweet: Tweet!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    
    @IBOutlet weak var profileButton: UIButton!
    
//    @IBAction func profileButtonPressed(sender: AnyObject) {
//        //var tweetInfo = self.tweet
//        if(self.delegate != nil){ //Just to be safe.
//            print("in action")
//            //print(tweetInfo)
//            self.delegate.callSegueFromCell(self.tweet!)
//            
//        }
//
//        
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
