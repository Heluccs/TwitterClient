//
//  ProfileViewController.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/29/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var numFollowing: UILabel!
    @IBOutlet weak var numTweet: UILabel!
    
    @IBOutlet weak var numFollowers: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    var user: User?
    var myTweets: [Tweet] = []
    var aTweet: Tweet?
    
    @IBOutlet weak var aboutUser: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        TwitterClient.sharedInstance.profileTimeline({(tweets: [Tweet]) -> () in
            self.myTweets = tweets
            self.aTweet = self.myTweets[1]
            print(self.myTweets)
            
            self.tableView.reloadData()
            self.viewDidLoad()
            print("ProfileTimeline")
            print(tweets.count)
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
                
        })
        
//        numFollowing.text = "\(User.currentUser!.following)" as String + " Following"
        
        numFollowers.text = "\(User.currentUser!.followers)" as String + " Followers" + "    " + "\(User.currentUser!.following)" as String + " Following"

        numTweet.text = "\(User.currentUser!.tweetCount)" + " Tweets"
        usernameLabel.text = "@" + "\(User.currentUser!.screename)"
        nameLabel.text = User.currentUser!.name as? String
        aboutUser.text = User.currentUser!.about as? String
        
        profileImage.setImageWithURL((User.currentUser?.userImageURL)!)
        
        
        
        if aTweet != nil {
      backgroundImage.setImageWithURL(aTweet!.bannerImageURL!)
        }
        
        
        
        
        
        
        
    
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        print("tableview func")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("postProfileCell", forIndexPath: indexPath) as! ProfilePostCell
        let tweet = myTweets[indexPath.row]
        print(tweet)
        print(tweet.profileImageURL)
        cell.username.text = User.currentUser!.name as? String
        
        cell.username.text = tweet.username
        cell.profileImage.setImageWithURL((User.currentUser?.userImageURL)!)
        print(cell.username.text)
        print("profile cell")
        cell.tweetText.text = tweet.text as? String
        cell.timestamp.text = tweet.date 
    
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTweets.count
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
