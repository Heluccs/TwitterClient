//
//  profileDetail.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/30/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class profileDetail: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweet: Tweet?
    var userTweets: [Tweet] = []
    
    @IBOutlet weak var screename: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetCount: UILabel!
    
    @IBOutlet weak var followerCount: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        print("at profile detail")
        print(tweet)
        
        
        
        if tweet != nil {
            
            
            TwitterClient.sharedInstance.userTimeline( (tweet?.screename)!, success:  {(tweets: [Tweet]) -> () in
                           self.userTweets = tweets
                
                print("usertweets", self.userTweets)
                
                self.tableView.reloadData()
                //            self.viewDidLoad()
                //            print("ProfileTimeline")
               
                }, failure: { (error: NSError) -> () in
                    print(error.localizedDescription)
                    
            })
            
            
    
        followerCount.text = "\(tweet!.followers)" + " Followers"
        followingCount.text = "\(tweet!.following)" + " Following"
        usernameLabel.text = tweet?.username
            profileImage.setImageWithURL((tweet!.profileImageURL)!)
            tweetCount.text = "\(tweet!.tweetCount)" + " Tweets"
        
            if tweet!.bannerImageURL != nil {
        bannerImage.setImageWithURL(tweet!.bannerImageURL!)
            }
        
            screename.text = "@" + tweet!.screename as! String
        
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! UserPostCell
        let userTweet = userTweets[indexPath.row]
        
        cell.username.text = userTweet.username
        cell.timestamp.text = userTweet.date
        cell.postImage.setImageWithURL(userTweet.profileImageURL!)
        cell.tweetPost.text = userTweet.text as! String
        
        
        return cell
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
    
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTweets.count
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
