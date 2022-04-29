//
//  WhereBuyCell.swift
//  NextStone
//
//  Created by Mac on 08/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class WhereBuyCell: UITableViewCell {
    
    
    @IBOutlet var companyImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func updateWithModel(_ model: WhereBuy) {
        companyImageView.image = model.image
        nameLabel.text = model.name
    }
    
}


