//
//  WindowWrapControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 09/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class WindowWrapControl: AbstractControl {
 
    //MARK: IBOutlets
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var numberofWindowsTextField: UITextField!
    @IBOutlet weak var windowsTableView: UITableView!
    @IBOutlet weak var numberOfDoorsView: UIView!
    @IBOutlet weak var tableViewHeightConst: NSLayoutConstraint!
    @IBOutlet var popupImageView: UIImageView!
    
    //MARK: Variables
    var checkValue : Bool = false
    var isButtonClicked : Bool = false
    var base = UserStore.sharedInsatnce.baseModel
    var cellCount = 0
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        windowsTableView.backgroundColor = .clear
        setButtonActions()
        setUI()
        popupImageView.image = UIImage(named: className())
        numberofWindowsTextField.addBorder(Constants.THEME_COLOR)
        windowsTableView.layer.borderColor = Constants.THEME_COLOR.cgColor
        windowsTableView.layer.borderWidth = 1.0
        
        let buttons = [noButton, yesButton]
        for button in buttons{
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = Constants.THEME_COLOR.cgColor
        }
        
        //register tableview cell
        let nib = UINib(nibName: "DoorWindowCell", bundle: nil)
        windowsTableView.register(nib, forCellReuseIdentifier: "DoorWindowCell")
    }
 
    //MARK: View Will Appears
    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
    }
    
    //MARK:- FUNCTIONS
    
    //FUNC SETUI
    func setUI() {
        numberofWindowsTextField.delegate = self
        if checkValue == true {
            numberOfDoorsView.isHidden = false
        } else {
            numberOfDoorsView.isHidden = true
            windowsTableView.isHidden = true
        }
    }
    
    //SET BUTTON ACTIONS
    func setButtonActions() {
        noButton.actionBlock {
            self.checkValue = false
            self.base?.windowWrapStatus = 0
            UserStore.sharedInsatnce.baseModel = self.base
            self.setUI()
            self.changeColor(self.noButton, self.yesButton)
            self.numberofWindowsTextField.text = nil
            self.tableViewHeightConst.constant = 50.0
            self.isButtonClicked = true
            Localstore.shared.wrapWindows = "0"
            Localstore.shared.wrapWindowsArray = []
        }
        yesButton.actionBlock {
            self.checkValue = true
            self.base?.windowWrapStatus = 1
            UserStore.sharedInsatnce.baseModel = self.base
            self.setUI()
            self.changeColor(self.yesButton, self.noButton)
            self.isButtonClicked = true
        }
    }
    
    //set tableview height
    func adjustHeightOfTableview() {
        view.layoutIfNeeded()
        tableViewHeightConst.constant = CGFloat(95 * Int(numberofWindowsTextField.text!)!)
    }
    
    //MARK:- BUTTON ACTIONS
    //Back button
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Next Button
    @IBAction func nextButton(_ sender: UIButton) {
        if isButtonClicked {
            if checkValue {
                if numberofWindowsTextField.text?.count != 0 {
                    if windowsTableView.isHidden == false {
                        makeJson()
                    }
                } else {
                    SVProgressHUD.showError(withStatus: Constants.empty_windows)
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
        navigationController?.pushViewController(SubmitControl.control, animated: true)
    }
    
    //Calculations
    func makeJson() {
        let count = cellCount
        var dic = [String : [String : Int]]()
        var jsonArray = [[String: [String : Int]]] ()

        if cellCount != 0 {
            for i in 0...count-1 {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = windowsTableView.cellForRow(at: indexPath) as! DoorWindowCell
                
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
            if jsonArray.count !=  cellCount
            {
                SVProgressHUD.showError(withStatus: "Please fill all the fields")
            } else {
                print(totalFeet)
                Localstore.shared.wrapWindows = "\(totalFeet)"
                Localstore.shared.wrapWindowsArray = jsonArray
                pushControl()
            }
        } else {
            Localstore.shared.wrapWindows = ""
            Localstore.shared.wrapWindowsArray = []
        }
    }
    
    //MARK:- TEXTFIELD DELEGATE
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(numberofWindowsTextField.text?.isEmpty)! {
            if numberofWindowsTextField.text != "0" && numberofWindowsTextField.text != "00" && numberofWindowsTextField.text != "000"{
                if  Int(numberofWindowsTextField.text!)!  < 101 {
                    cellCount = Int(numberofWindowsTextField.text!)!
                    windowsTableView.isHidden = false
                    windowsTableView.reloadData()
                    adjustHeightOfTableview()
                }else{
                    SVProgressHUD.showError(withStatus: Constants.corner_Max_Value_Count)
                }
            }
        }else {
            tableViewHeightConst.constant = 50
            windowsTableView.isHidden = true
        }
    }
}
