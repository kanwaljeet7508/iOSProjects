//
//  DoorWrapControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 07/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class DoorWrapControl: AbstractControl{
    
    //MARK: IBOutlets
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var numberOfDoorsView: UIView!
    @IBOutlet weak var numberofDoorsTextField: UITextField!
    @IBOutlet weak var doorTableView: UITableView!
    @IBOutlet weak var tblViewHieghtConstraint: NSLayoutConstraint!
    @IBOutlet var popupImageView: UIImageView!
    
    //MARK: Variables
    var checkValue : Bool = false
    var isButtonClicked: Bool = false
    var base = UserStore.sharedInsatnce.baseModel
    var cellCount = 0

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonActions()
        setUI()
        popupImageView.image = UIImage(named: className())
        numberofDoorsTextField.addBorder(Constants.THEME_COLOR)
        doorTableView.layer.borderColor = Constants.THEME_COLOR.cgColor
        doorTableView.layer.borderWidth = 1.0
        doorTableView.backgroundColor = .clear

        let buttons = [noButton, yesButton]
        for button in buttons {
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = Constants.THEME_COLOR.cgColor
        }
        
        //register tableview cell
        let nib = UINib(nibName: "DoorWindowCell", bundle: nil)
        doorTableView.register(nib, forCellReuseIdentifier: "DoorWindowCell")
        
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
    }
    
    //MARK:- FUNCTIONS
    //FUNC SETUI
    func setUI() {
        numberofDoorsTextField.delegate = self
        if checkValue {
            numberOfDoorsView.isHidden = false
        } else {
            numberOfDoorsView.isHidden = true
            doorTableView.isHidden = true
        }
    }
    
    //SET BUTTON ACTIONS
    func setButtonActions() {
        noButton.actionBlock {
            self.checkValue = false
            self.base?.doorsWrapStatus = 0
            UserStore.sharedInsatnce.baseModel = self.base
            self.setUI()
            self.changeColor(self.noButton, self.yesButton)
            self.numberofDoorsTextField.text = nil
            self.tblViewHieghtConstraint.constant = 50.0
            self.isButtonClicked = true
            Localstore.shared.wrapDoor = "0"
            Localstore.shared.wrapDoorArray = []
        }
        
        yesButton.actionBlock {
            self.checkValue = true
            self.base?.doorsWrapStatus = 1
            UserStore.sharedInsatnce.baseModel = self.base
            self.setUI()
            self.changeColor(self.yesButton, self.noButton)
            self.isButtonClicked = true
        }
    }
    
    //set tableview height
    func adjustHeightOfTableview() {
        view.layoutIfNeeded()
        tblViewHieghtConstraint.constant = CGFloat(95 * Int(numberofDoorsTextField.text!)!) 
    }
    
    //MARK:- BUTTON ACTIONS
    //BackButton
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Next Button
    @IBAction func nextButton(_ sender: UIButton) {
        if isButtonClicked {
            if checkValue {
                if numberofDoorsTextField.text?.count != 0 {
                    if doorTableView.isHidden == false {
                        makeJson()
                    }
                } else {
                    SVProgressHUD.showError(withStatus: Constants.empty_doors)
                }
            } else {
                pushControl()
            }
        } else {
            SVProgressHUD.showError(withStatus: Constants.select_option)
        }
    }
    
    //Navigate View
    func pushControl() {
        navigationController?.pushViewController(WindowWrapControl.control, animated: true)
    }
    
    //Calculations
    func makeJson() {
        let count = cellCount
        var dic = [String : [String : Int]]()
        var jsonArray = [[String: [String : Int]]] ()

        if cellCount != 0 {
            for i in 0...count-1 {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = doorTableView.cellForRow(at: indexPath) as! DoorWindowCell
                if (cell.feetWidthTF.text?.count != 0) && (cell.feetHeightTF.text?.count != 0) {
                    if cell.inchesWidthTF.text == "" {
                        if cell.inchesHeightTF.text == ""  {
                            value1 = Int(cell.feetWidthTF.text!)! * 12
                            value2 = Int(cell.feetHeightTF.text!)! * 12
                            finalInches = value1 + value2
                            feet = Double(finalInches)/12.0
                            dic = ["Width" : ["Feet": Int(cell.feetWidthTF.text!) , "Inches": 0] , "Height" : ["Feet": Int(cell.feetHeightTF.text!) , "Inches": 0]] as! [String : [String : Int]]
                        } else {
                            value1 = Int(cell.feetWidthTF.text!)! * 12
                            value2 = Int(cell.feetHeightTF.text!)! * 12
                            finalInches = value1 + value2 + Int(cell.inchesHeightTF.text!)!
                            feet = Double(finalInches)/12.0
                            dic = ["Width" : ["Feet": Int(cell.feetWidthTF.text!) , "Inches": 0] , "Height" : ["Feet": Int(cell.feetHeightTF.text!) , "Inches": Int(cell.inchesHeightTF.text!)!]] as! [String : [String : Int]]
                        }
                    } else if cell.inchesHeightTF.text == "" {
                        value1 = Int(cell.feetWidthTF.text!)! * 12
                        value2 = Int(cell.feetHeightTF.text!)! * 12
                        finalInches = value1 + value2 + Int(cell.inchesWidthTF.text!)!
                        feet = Double(finalInches)/12.0
                        dic = ["Width" : ["Feet": Int(cell.feetWidthTF.text!) , "Inches": Int(cell.inchesWidthTF.text!)!] , "Height" : ["Feet": Int(cell.feetHeightTF.text!) , "Inches": 0]] as! [String : [String : Int]]
                    }
                    else {
                        value1 = Int(cell.feetWidthTF.text!)! * 12
                        value2 = Int(cell.feetHeightTF.text!)! * 12
                        finalInches = value1 + value2 + Int(cell.inchesWidthTF.text!)! + Int(cell.inchesHeightTF.text!)!
                        feet = Double(finalInches)/12.0
                        dic = ["Width" : ["Feet": Int(cell.feetWidthTF.text!) , "Inches": Int(cell.inchesWidthTF.text!)!] , "Height" : ["Feet": Int(cell.feetHeightTF.text!) , "Inches": Int(cell.inchesHeightTF.text!)!]] as! [String : [String : Int]]
                    }
                    jsonArray.append(dic)
                    totalFeet = totalFeet + feet
                }
            }
            print(jsonArray)
            if jsonArray.count !=  cellCount {
                SVProgressHUD.showError(withStatus: "Please fill all the fields")
            } else {
                print(totalFeet)
                Localstore.shared.wrapDoor = "\(totalFeet)"
                Localstore.shared.wrapDoorArray = jsonArray
                pushControl()
            }
        } else {
            Localstore.shared.wrapDoor = ""
            Localstore.shared.wrapDoorArray = []
        }
    }
    
    //MARK:- TEXTFIELD DELEGATE
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(numberofDoorsTextField.text?.isEmpty)! {
            if numberofDoorsTextField.text != "0" && numberofDoorsTextField.text != "00" && numberofDoorsTextField.text != "000"{
                if  Int(numberofDoorsTextField.text!)!  < 101 {
                    cellCount = Int(numberofDoorsTextField.text!)!
                    doorTableView.isHidden = false
                    doorTableView.reloadData()
                    adjustHeightOfTableview()
                }else{
                     SVProgressHUD.showError(withStatus: Constants.corner_Max_Value_Count)
                }
            }
        }else {
            tblViewHieghtConstraint.constant = 50
            doorTableView.isHidden = true
        }
    }
}
