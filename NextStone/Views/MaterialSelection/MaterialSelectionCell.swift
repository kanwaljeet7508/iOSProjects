//
//  MaterialSelectionCell.swift
//  NextStone
//
//  Created by Mobile on 02/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class MaterialSelectionCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var materialNameLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = Constants.THEME_COLOR.cgColor
        layer.borderWidth = 0.5
    }
}


