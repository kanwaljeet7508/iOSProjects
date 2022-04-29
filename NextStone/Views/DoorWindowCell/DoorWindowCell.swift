//
//  DoorWindowCell.swift
//  NextStone
//
//  Created by User on 04/07/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class DoorWindowCell: UITableViewCell {

    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var feetWidthTF: UITextField!
    @IBOutlet weak var inchesWidthTF: UITextField!
    @IBOutlet weak var feetHeightTF: UITextField!
    @IBOutlet weak var inchesHeightTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        feetWidthTF.addBorder(Constants.THEME_COLOR)
        inchesWidthTF.addBorder(Constants.THEME_COLOR)
        feetHeightTF.addBorder(Constants.THEME_COLOR)
        inchesHeightTF.addBorder(Constants.THEME_COLOR)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
