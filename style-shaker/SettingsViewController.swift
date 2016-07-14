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
    let ME_CELL = "me_cell"
    let ME_CUSTOM_CELL = "me_custom_cell"
    let SETTINGS_TO_MOOD = "settings_to_mood"
    let HAIR: Int = 1
    let SKIN: Int = 2
    let SEX: Int = 3
    var settings: UserSettings = UserSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: MonMoodViewController = segue.destinationViewController as! MonMoodViewController
        controller.settings = self.settings
        
    }
    
    @IBAction func validateAction(sender: AnyObject) {
        self.performSegueWithIdentifier(SETTINGS_TO_MOOD, sender: self.settings)
    }
    
    @IBAction func switchAction(sender: AnyObject) {
        let clickedSwitch: UISwitch = sender as! UISwitch
        
        switch clickedSwitch.tag{
        case HAIR:
            settings.hairDark = !clickedSwitch.on
            settings.hairBright = clickedSwitch.on
            break
        case SKIN:
            settings.skinBright = clickedSwitch.on
            settings.skinDark = !clickedSwitch.on
            break
        case SEX:
            settings.male = clickedSwitch.on
            settings.female = !clickedSwitch.on
            break
        default: break
            
        }
        
        
        
    }
   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell : MyMeTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as! MyMeTableViewCell
        cell.lblLeft.text = "toto"
 
    }*/
    
    
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
            customCell.cellswitch.tag = HAIR
            return customCell
        case 2:
            customCell.title.text = "Peau"
            customCell.lblLeft.text = "Foncé"
            customCell.lblRight.text = "Clair"
            customCell.cellswitch.tag = SKIN
            return customCell
        case 3:
            customCell.title.text = "Sexe"
            customCell.lblLeft.text = "Femelle"
            customCell.lblRight.text = "Male"
            customCell.cellswitch.tag = SEX
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
