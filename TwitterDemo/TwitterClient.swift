//
//  TwitterClient.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/27/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "QBkSRuogzSS7tgGd2BnXgD8Yd", consumerSecret: "IW7gXGitPgE1qgoSi5s7afZr0sWhZpSaXtEa6D6bJsl1Tsiybw")
    
    var loginSuccess: ( () -> () )?
    var loginFailure: ( (NSError) -> () )?
       
    
    func currentAccount(success: (User) -> (), failure: (NSError) -> ()) {
        GET("1.1/account/verify_credentials.json", parameters: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            let userDictionary = response as! NSDictionary

            let user = User(dictionary: userDictionary)
            success(user)
            
        
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("error: \(error.localizedDescription)")
        })

        
    }
    
    func homeTimeline(success: ([Tweet]) -> (), failure: (NSError) -> ()){
        
        
        GET("1.1/statuses/home_timeline.json", parameters: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
        
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
        
            success(tweets)
        
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })
        
    
}
    func profileTimeline( success: ([Tweet]) -> (), failure: (NSError) -> ()){
        
        
        
        GET("1.1/statuses/user_timeline.json", parameters:nil , success: { (task: NSURLSessionDataTask, response: AnyObject?) -> Void in
            
            let dictionaries = response as! [NSDictionary]
            let tweets = Tweet.tweetsWithArray(dictionaries)
            
            success(tweets)
            
            }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error)
        })
    }
    
    
    func login(success: () -> (), failure: (NSError) -> ()) {
        loginSuccess = success
        loginFailure = failure
        TwitterClient.sharedInstance.deauthorize()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!)-> Void in print("got token!")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            //print(url)
            UIApplication.sharedApplication().openURL(url)
            
        }) {(error: NSError!) -> Void in
            print("error: \(error.localizedDescription)")
            self.loginFailure?(error) 
        }
    }
    
    func logout() {
        User.currentUser = nil
        deauthorize()
        
        NSNotificationCenter.defaultCenter().postNotificationName(User.userDidLogoutNotification, object: nil)
    }

    func handleOpenURL(url: NSURL ) {
        
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) -> Void in
            
            self.currentAccount({ (user: User) -> () in
                User.currentUser = user
                self.loginSuccess?()
                }, failure: { (error: NSError) -> () in
                self.loginFailure?(error)

            })
            self.loginSuccess?()
            
            
            
        }) { (error: NSError!) in
            print("error: \(error.localizedDescription)")
            self.loginFailure?(error)
        }
    }
    
    func postTweet(params: NSDictionary) {
            print(params)
            
            POST("1.1/statuses/update.json", parameters: params, success: { (task: NSURLSessionDataTask, response: AnyObject?) in
                print("posted tweet")
                
               
            }) { (task: NSURLSessionDataTask?, error: NSError) in
                print("error")
                print(error.localizedDescription)
                
            }
        }
    
    func retweet(id: String) {
        
        POST("1.1/statuses/retweet/\(id).json", parameters: nil, success: { (task: NSURLSessionDataTask, response: AnyObject?) in
            print("RT!!!")
            
            
        }) { (task: NSURLSessionDataTask?, error: NSError) in
        print(error.localizedDescription)
        
        }
        
    
    
    }
    
    
    
    func favorite(id: String) {
        var params = NSDictionary()
        params = ["id": id]
        POST("1.1/favorites/create.json", parameters: params, success: { (task: NSURLSessionDataTask, response: AnyObject?) in
            print("favorited!!!")
            
            
        }) { (task: NSURLSessionDataTask?, error: NSError) in
            print(error.localizedDescription)
            
            
        }
        
        
        
    }

        
    
    
    

}

