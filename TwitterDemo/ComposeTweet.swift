//
//  ComposeTweet.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/30/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class ComposeTweet: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var image: UIImageView!
    @IBAction func publishAction(sender: AnyObject) {
        if let text = tweetTextField.text{
            let params = ["status": text]

            TwitterClient.sharedInstance.postTweet(params)
            
            print("post tweet")
            
            //perform a segue
            
            navigationController?.popToRootViewControllerAnimated(true)
            
            
        }
    }
    @IBOutlet weak var tweetTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Whats on your mind " + ((User.currentUser?.name)! as String) as! String + "?"
        
        image.setImageWithURL((User.currentUser?.userImageURL)!)
        

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
