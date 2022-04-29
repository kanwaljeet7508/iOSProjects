//
//  CommercialHeader.swift
//  NextStone
//
//  Created by Mac on 15/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class BuyHeader: AbstractView {

    var frameHeight: CGFloat {
        return 100.0
    }
    
    override func initViews() {
        super.initViews()
        frame = CGRect(x: 0, y: 0, width: UIScreen.mainBounds.width, height: frameHeight)
        backgroundColor = .white
        addSubviews([nameLabel, lineView])
    }
    
    var title: String {
        get {
            return nameLabel.text!
        }
        set {
            nameLabel.text = newValue
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Constants.THEME_COLOR
        label.textAlignment = .left
        label.font = UIFont(name: "Roboto-Regular" , size: 15.0)
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addVisualConstraints(["H:|-10-[label]-10-|", "H:|[line]|", "V:|[label][line(0.5)]|"], subviews: ["label": nameLabel, "line": lineView])
    }
    
}


