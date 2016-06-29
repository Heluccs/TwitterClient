//
//  detailsViewController.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/29/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit


class detailsViewController: UIViewController {
    var tweet: Tweet?

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var faveCountLabel: UILabel!
    @IBOutlet weak var RTCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetLabel.text = tweet!.text as! String
        faveCountLabel.text = "\(tweet!.favoritesCount)"
        RTCountLabel.text = "\(tweet!.retweetCount)"
        usernameLabel.text = tweet?.username
        
        

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
