//
//  User.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/27/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: NSString?
    var screename: NSString!
    var profileURL: NSURL?
    var tagline: NSString?
    var dictionary: NSDictionary?
    var userImageURL: NSURL?
    var following: Int = 0
    var followers: Int = 0
    var tweetCount: Int = 0
    var bannerImageURL: NSURL?
    var about: NSString?
    
   

    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        print("olivia dictionary")
        
        print(dictionary["profile_banner_url"])
        print(dictionary)
        name = dictionary["name"] as? String
        
        screename = dictionary["screen_name"] as? String
        followers = dictionary["followers_count"] as! Int
        following = dictionary["friends_count"] as! Int
        
        tweetCount = dictionary["statuses_count"] as! Int
        about = dictionary["description"] as? String
      
        
        
        let profileURLString = dictionary["profile_image_url_https"] as? String
        if let profileURLString = profileURLString {
            profileURL = NSURL( string: profileURLString)
        
        }
        
        if let userImageURLString = dictionary["profile_image_url_https"] as? String {
            userImageURL = NSURL(string: userImageURLString.stringByReplacingOccurrencesOfString("_normal", withString: ""))
        }
        
//        if let bannerURLString = dictionary["profile_banner_url"]{
//            bannerImageURL = NSURL( string: bannerURLString.stringByReplacingOccurrencesOfString("_normal", withString: ""))
//            print(bannerImageURL, "banner image URL")
//            
//        }
        
        
        
//        if let bannerImageURLString = dictionary["profile_banner_url"] as? String{
//            print("bannerURL")
//            if bannerImageURLString != "<null>" {
//                print("bannerImageURLString")
//                print(bannerImageURLString)
//                
//            
//            bannerImageURL = NSURL(string: bannerImageURLString.stringByReplacingOccurrencesOfString("_normal", withString: ""))
////            print(bannerImageURL)
////            }
////        
////            
////        }
        
        
        
        
//        userImageURL = dictionary["profile_image_url"] as! String
//        if let userImageURL = userImageURL {
//            userImageNSURL = NSURL(string: userImageURL)
//            print(userImageNSURL)
//           
//        }
//        
    
        
        
        
        tagline = dictionary["description"] as? String
        
        
    }
    
    static var _currentUser: User?
    static let userDidLogoutNotification = "UserDidLogout"
    class var currentUser: User? {
        get{
            if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            let userData = defaults.objectForKey("currentUserData") as? NSData
            
            if let userData = userData{
                let dictionary = try!
                    NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                _currentUser = User(dictionary: dictionary)
                }
            }
           return _currentUser
        }
        
        set(user) {
            //_currentUser = user
             let defaults = NSUserDefaults.standardUserDefaults()
            if let user = user {
                let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                defaults.setObject(data, forKey: "currentUserData")
            }
            else{
            defaults.setObject(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize()
        }
    }
}
