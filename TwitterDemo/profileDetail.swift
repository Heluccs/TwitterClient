//
//  profileDetail.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/30/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class profileDetail: UIViewController {
    
    var tweet: Tweet?
    
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetCount: UILabel!
    
    @IBOutlet weak var followerCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("at profile detail")
        print(tweet)
        if tweet != nil {
    
        followerCount.text = "\(tweet!.followers)"
        followingCount.text = "\(tweet!.following)"
        usernameLabel.text = tweet?.username
            profileImage.setImageWithURL((tweet!.profileImageURL)!)
            tweetCount.text = "\(tweet?.tweetCount)"
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
    
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
