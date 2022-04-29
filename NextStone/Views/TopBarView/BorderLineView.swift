//
//  HomeCell.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

@IBDesignable
class BorderLineView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
  
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    func initViews() {
        backgroundColor = Constants.THEME_COLOR
    }
    
    // MARK: - Layout methods
    override open func layoutSubviews() {
        super.layoutSubviews()
        _ = addConstraintForHeight(0.5)
    }
    
}


