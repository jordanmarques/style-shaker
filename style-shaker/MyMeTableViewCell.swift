//
//  MyMeTableViewCell.swift
//  style-shaker
//
//  Created by Jordan Marques on 28/06/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class MyMeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cellswitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
