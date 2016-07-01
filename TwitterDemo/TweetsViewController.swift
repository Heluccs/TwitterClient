//
//  TweetsViewController.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/27/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit
//
//protocol myCellDelegator {
//    func callSegueFromCell(data: Tweet)
//}

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var tweets: [Tweet] = []
    var refreshControl = UIRefreshControl()

    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tweetsTableView.reloadData()
        print("viewDidLoad")
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tweetsTableView.insertSubview(refreshControl, atIndex: 0)
        tweetsTableView.estimatedRowHeight = 500
        tweetsTableView.rowHeight = UITableViewAutomaticDimension

        
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tweetsTableView.reloadData()
            print("HomeTimeline")
            print(tweets.count)
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
                
        })
        
        
        
        
        
        tweetsTableView.delegate = self
        tweetsTableView.dataSource = self
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! PostCell
        print("tableView")
        
        
        
            let tweet = tweets[indexPath.row]
        
            cell.tweet = tweet
            let text = tweet.text as! String
            cell.tweetLabel.text = text
            print(tweet.text)
            cell.timestampLabel.text = tweet.date
            cell.usernameLabel.text = tweet.username
            cell.profileImage.setImageWithURL(tweet.profileImageURL!)
        cell.screename.text = "@" + tweet.screename as String
        
            //cell.delegate = self
        
            
            //print(cell.profileImage)
        
        
        
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tweets.count)
        return tweets.count
    }
    
//    func callSegueFromCell(data: Tweet) {
//        print("segue to profile details")
//        self.performSegueWithIdentifier("detailProfile", sender: data )
//
//    }
    
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            self.tweetsTableView.reloadData()
            
           
            }, failure: { (error: NSError) -> () in
                print(error.localizedDescription)
                
        })
        
        
        self.tweetsTableView.reloadData()
        
        refreshControl.endRefreshing()
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if( segue.identifier == "detailSegue") {
       
        let cell = sender as! UITableViewCell
        let indexPath = tweetsTableView.indexPathForCell(cell)
        let tweet = tweets[indexPath!.row]
        
        let detailViewController = segue.destinationViewController as!detailsViewController
        
            detailViewController.tweet = tweet
        } else if(segue.identifier == "detailProfile") {
            print("went here")
            
            let profileButton = sender as? UIButton
            let contentView = profileButton?.superview
            let postCell = contentView?.superview as? PostCell
            
            let indexPath = tweetsTableView.indexPathForCell(postCell!)
            let tweet = tweets[indexPath!.row]
            
            let vc: profileDetail = segue.destinationViewController as! profileDetail
            
            vc.tweet = tweet
        }
        
       
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
