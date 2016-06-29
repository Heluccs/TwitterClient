//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Olivia Koshy on 6/27/16.
//  Copyright © 2016 Olivia Koshy. All rights reserved.
//

import UIKit
var _timelineTweets: [Tweet]?

class Tweet: NSObject {
    
    
    var text: NSString?
    var timestamp: NSDate?
    var timestampString: String?
    var date = "" as String
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var username : String = ""
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as! Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as! Int) ?? 0
        timestampString = (dictionary["created_at"] as! String) ?? ""
        let user = dictionary["user"]
        print(user)
        
        if let user = user {
            username = user["name"] as! String
            print(username)
        }
        
    
        
        if let timestampString = timestampString{
            print(timestampString)
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
            date = Tweet.timeAgo(timestamp!)
            print(date)
        }
        
        
       
        
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        print("tweetsWithArray")
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        print("got tweets")
        return tweets
    }
    
    class func timeAgo(date: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let unitFlags: NSCalendarUnit = [.Second, .Minute, .Hour, .Day, .WeekOfYear, .Month, .Year]
        let components = calendar.components(unitFlags, fromDate: date, toDate: now, options: [])
        if components.year >= 2 {
            return "\(components.year) years ago"
        }
        
        if components.year >= 1 {
            return "Last year"
        }
        
        if components.month >= 2 {
            return "\(components.month) months ago"
        }
        
        if components.month >= 1 {
            return "Last month"
        }
        
        if components.weekOfYear >= 2 {
            return "\(components.weekOfYear) weeks ago"
        }
        
        if components.weekOfYear >= 1 {
            return "Last week"
        }
        
        if components.day >= 2 {
            return "\(components.day) days ago"
        }
        
        if components.day >= 1 {
            return "Yesterday"
        }
        
        if components.hour >= 2 {
            return "\(components.hour) h"
        }
        
        if components.hour >= 1 {
            return "An hour ago"
        }
        
        if components.minute >= 2 {
            return "\(components.minute) m"
        }
        
        if components.minute >= 1 {
            return " 1 m"
        }
        
        if components.second >= 3 {
            return "\(components.second) sec"
        }
        
        return "Just now"
        
    }

    
  
    

}
