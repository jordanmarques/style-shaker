//
//  MonStyleViewController.swift
//  style-shaker
//
//  Created by Jordan Marques on 12/07/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class MonStyleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    @IBOutlet weak var tableview: UITableView!
    let MON_STYLE_CUSTOM_CELL = "mon_style_custom_cell"
    let STYLE_TO_DETAIL = "StyleToDetail"
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell: MonStyleTableViewCell = tableView.dequeueReusableCellWithIdentifier(MON_STYLE_CUSTOM_CELL) as! MonStyleTableViewCell
        
        customCell.title.text = self.posts[indexPath.row].title
            
        if let url = NSURL(string: self.posts[indexPath.row].picture) {
            if let data = NSData(contentsOfURL: url) {
                customCell.cellImage.image = UIImage(data: data)
            }        
        }
        
        return customCell
        
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
