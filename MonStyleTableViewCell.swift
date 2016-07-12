//
//  MonStyleTableViewCell.swift
//  style-shaker
//
//  Created by Jordan Marques on 12/07/2016.
//  Copyright © 2016 totolab. All rights reserved.
//

import UIKit

class MonStyleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
