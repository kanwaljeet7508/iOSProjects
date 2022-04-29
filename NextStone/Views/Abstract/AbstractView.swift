//
//  AbstractView.swift
//
//  Created by Lakhwinder Singh on 07/09/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import UIKit

/*
 AbstractView to manage all common functions to use in custom uiview classes
 */
class AbstractView: UIView {

    //MARK:-  This method will call if view is called programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    //MARK:-  This method will call if view is called through storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    //MARK:- This function can inherit in child classes to init objects
    func initViews() {}

}


