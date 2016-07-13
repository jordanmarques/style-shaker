//
//  PostRetriever.swift
//  style-shaker
//
//  Created by Jordan Marques on 13/07/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import Foundation

class PostRetriever: NSObject{
    let API_ENDPOINT: NSURL = NSURL(string: "http://163.172.27.134/api/products")!
    
    override init() {
    
    }
    
    func retrieve() -> [Post]{
        var posts:[Post] = []

        let task = NSURLSession.sharedSession().dataTaskWithURL(API_ENDPOINT) { (data, response, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                for item in json as! [[String: AnyObject]] {
                    
                    let post: Post = Post(about: item["about"] as! String,
                                          tags: item["tags"] as! [String],
                                          picture: item["picture"] as! String,
                                          thumbnail: item["thumbnail"] as! String,
                                          party: item["criteria"]!["mood"]!!["party"] as! Bool,
                                          weekend: item["criteria"]!["mood"]!!["weekend"] as! Bool,
                                          chill: item["criteria"]!["mood"]!!["chill"] as! Bool,
                                          work: item["criteria"]!["mood"]!!["work"] as! Bool,
                                          male: item["criteria"]!["gender"]!!["male"] as! Bool,
                                          female: item["criteria"]!["gender"]!!["female"] as! Bool,
                                          hairDark: item["criteria"]!["hair"]!!["dark"] as! Bool,
                                          hairBright: item["criteria"]!["hair"]!!["bright"] as! Bool,
                                          skinDark: item["criteria"]!["skin"]!!["dark"] as! Bool,
                                          skinBright: item["criteria"]!["skin"]!!["bright"] as! Bool,
                                          title: item["title"] as! String,
                                          id: item["id"] as! String
                    )
                    
                    posts.append(post);
                    print("append")
                }
            }
            catch {
                print("Error during serialization");
            }
        }
        
        task.resume()

        
        return posts
    }
}
