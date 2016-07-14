//
//  MonMoodViewController.swift
//  style-shaker
//
//  Created by Jordan Marques on 28/06/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class MonMoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableview: UITableView!
    let MON_MOOD_CELL = "mon_mood_cell"
    let MON_MOOD_CUSTOM_CELL = "mon_mood_custom_cell"
    let MOOD_TO_STYLE = "MoodToStyle"
    let WORK: Int = 1
    let PARTY: Int = 2
    let WEEKEND: Int = 3
    let CHILL: Int = 4
    var posts: [Post] = []
    var settings: UserSettings = UserSettings()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        retrieve()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func validateBtnAction(sender: AnyObject) {
        self.performSegueWithIdentifier(MOOD_TO_STYLE, sender: self.posts)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 150
        }
        
        return 80
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: MonStyleViewController = segue.destinationViewController as! MonStyleViewController
        controller.posts = self.posts
        
    }

    @IBAction func switchAction(sender: AnyObject) {
        let clickedSwitch: UISwitch = sender as! UISwitch

        switch clickedSwitch.tag{
        case WORK:
            self.settings.work = clickedSwitch.on
            break
        
        case PARTY:
            self.settings.party = clickedSwitch.on
            break
            
        case WEEKEND:
            self.settings.weekend = clickedSwitch.on
            break
            
        case CHILL:
            self.settings.chill = clickedSwitch.on
            break
            
        default: break
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell: MonMoodTableViewCell = tableView.dequeueReusableCellWithIdentifier(MON_MOOD_CUSTOM_CELL) as! MonMoodTableViewCell
        
        switch indexPath.row {
        case 0:
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(MON_MOOD_CELL)!
            return cell
        case 1:
            customCell.title.text = "Tavail"
            customCell.cellswitch.tag = WORK
            return customCell
        case 2:
            customCell.title.text = "Soirée"
            customCell.cellswitch.tag = PARTY
            return customCell
        case 3:
            customCell.title.text = "Week-End"
            customCell.cellswitch.tag = WEEKEND
            return customCell
        case 4:
            customCell.title.text = "Chill"
            customCell.cellswitch.tag = CHILL
            return customCell
        default:
            return customCell
        }
    }

    func retrieve(){
        let API_ENDPOINT: NSURL = NSURL(string: "http://163.172.27.134/api/products")!
        
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
                    
                    self.posts.append(post);
                }
            }
            catch {
                print("Error while serialization");
            }
        }
        
        task.resume()
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
