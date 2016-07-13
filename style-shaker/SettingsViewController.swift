//
//  SettingsViewController.swift
//  style-shaker
//
//  Created by Jordan Marques on 08/06/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    let ME_CELL:String = "me_cell"
    let ME_CUSTOM_CELL = "me_custom_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let customCell: MyMeTableViewCell = tableView.dequeueReusableCellWithIdentifier(ME_CUSTOM_CELL) as! MyMeTableViewCell
        
        switch indexPath.row {
        case 0:
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(ME_CELL)!
            return cell
        case 1:
            customCell.title.text = "Cheveux"
            customCell.lblLeft.text = "Foncé"
            customCell.lblRight.text = "Clair"
            return customCell
        case 2:
            customCell.title.text = "Peau"
            customCell.lblLeft.text = "Foncé"
            customCell.lblRight.text = "Clair"
            return customCell
        case 3:
            customCell.title.text = "Sexe"
            customCell.lblLeft.text = "Femelle"
            customCell.lblRight.text = "Male"
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
