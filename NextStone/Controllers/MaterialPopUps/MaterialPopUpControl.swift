//
//  MaterialPopUpControl.swift
//  NextStone
//
//  Created by Mobile on 06/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class MaterialPopUpControl: AbstractControl  {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backFullScreenButton: UIButton!
    @IBOutlet weak var materialCollectionPopupView: UICollectionView!
    
    var imagesArray : [String]?
    var nameId: String!
    
    //MARK:- CLASS FUNCTIONS
    class func showControl(_ imagesArray : [String], _ name: String) {
        let control = self.control as! MaterialPopUpControl
        UIApplication.visibleViewController.customAddChildViewController(control)
        control.imagesArray = imagesArray
        control.imagesArray?.remove(at: 0)
        control.nameId = name
    }
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        screenCheck = false
        super.viewDidLoad()
        //button actions
        backFullScreenButton.actionBlock {
            self.closePopup()
        }
        //continue actions
        continueButton.actionBlock {
            self.closePopup()
            UIApplication.visibleNavigationController.pushViewController(RockColorControl.controlWithName(self.nameId), animated: true)
        }
    }
    
    func closePopup() {
        UIApplication.visibleViewController.customRemoveAllChildViewControllers()
    }
}
