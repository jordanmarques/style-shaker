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
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 150
        }
        
        return 80
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell: MonMoodTableViewCell = tableView.dequeueReusableCellWithIdentifier(MON_MOOD_CUSTOM_CELL) as! MonMoodTableViewCell
        
        switch indexPath.row {
        case 0:
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(MON_MOOD_CELL)!
            return cell
        case 1:
            customCell.title.text = "Tavail"
            return customCell
        case 2:
            customCell.title.text = "Soirée"
            return customCell
        case 3:
            customCell.title.text = "Week-End"
            return customCell
        case 4:
            customCell.title.text = "Chill"
            return customCell
        default:
            return customCell
        }
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
