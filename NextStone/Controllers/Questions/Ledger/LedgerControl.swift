//
//  LedgerControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class LedgerControl: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var popupImageView: UIImageView!
    @IBOutlet weak var inchesTF: UITextField!
    @IBOutlet weak var feetTF: UITextField!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feetTF.addBorder(Constants.THEME_COLOR)
        self.inchesTF.addBorder(Constants.THEME_COLOR)
        popupImageView.image = UIImage(named: className())
    }
    
    //MARK:- BUTTON ACTIONS
    //Back Button
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    //Next Button
    @IBAction func nextButton(_ sender: UIButton) {
        if (feetTF.text?.isEmpty)! {
            if (inchesTF.text?.isEmpty)! {
                SVProgressHUD.showError(withStatus: "Please enter value")
            }
            else {
                value1 = Int(inchesTF.text!)!
                feet = Double(value1)/12.0
                saveData(feet)
            }
        } else {
            if (inchesTF.text?.isEmpty)! {
                value1 = Int(feetTF.text!)! * 12
                feet = Double(value1)/12.0
            }
            else {
                value1 = Int(feetTF.text!)! * 12
                value2 = Int(inchesTF.text!)!
                finalInches = value1 + value2
                feet = Double(finalInches)/12.0
            }
            saveData(feet)
        }
    }
    
    //MARK: Save Data
    func saveData(_ totalFeet : Double) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.ledger = "\(totalFeet)"
        UserStore.sharedInsatnce.baseModel = base
        self.navigationController?.pushViewController(TerminationControl.control, animated: true)
    }

    
}


