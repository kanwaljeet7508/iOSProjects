//
//  HomeCell.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var CellbackgroundView: UIView!
    @IBOutlet weak var homeCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        CellbackgroundView.layer.cornerRadius = 10.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
