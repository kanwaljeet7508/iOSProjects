//
//  WrappingDoorCell.swift
//  NextStone
//
//  Created by Hakikat Singh on 08/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class WrappingDoorCell: UITableViewCell {

    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var heightTextfield: UITextField!
    @IBOutlet weak var widthTextField: UITextField!    
    @IBOutlet weak var xLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
      //  self.layer.borderColor = Constants.THEME_COLOR.cgColor
      //  self.layer.borderWidth = 1.0
        heightTextfield.addBorder(Constants.THEME_COLOR)
        widthTextField.addBorder(Constants.THEME_COLOR)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
