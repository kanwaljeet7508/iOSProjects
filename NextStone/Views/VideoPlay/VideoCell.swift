//
//  VideoCell.swift
//  NextStone
//
//  Created by Mac on 11/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!

    func updateWithModel(_ model: VideoPlay) {
        nameLabel.text = model.name
    }
    
}


