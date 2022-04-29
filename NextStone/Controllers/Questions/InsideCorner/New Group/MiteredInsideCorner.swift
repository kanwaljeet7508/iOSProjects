//
//  MiteredInsideCorner.swift
//  NextStone
//
//  Created by User on 13/08/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class MiteredInsideCorner: AbstractControl {
    
    //MARK: IBOutlet
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var textFeild: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHowMany: UIView!
    
    //MARK: Variables
    var cellCount = 0
    var checkValue : Bool = false
    var isButtonClicked: Bool = false

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonActions()
        setUI()
        textFeild.addBorder(Constants.THEME_COLOR)
        tableView.layer.borderColor = Constants.THEME_COLOR.cgColor
        tableView.layer.borderWidth = 1.0
        tableView.backgroundColor = .clear
        
        let buttons = [noButton, yesButton]
        for button in buttons {
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = Constants.THEME_COLOR.cgColor
        }
        
        //register tableview cell
        let nib = UINib(nibName: "WrappingDoorCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WrappingDoorCell")

    }

    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
    }

    func setUI() {
        if checkValue {
            viewHowMany.isHidden = false
        } else {
            viewHowMany.isHidden = true
            tableView.isHidden = true
        }
    }

    //MARK: Button Actions
    func setButtonActions() {
        noButton.actionBlock {
            self.checkValue = false
            self.setUI()
            self.changeColor(self.noButton, self.yesButton)
            self.textFeild.text = nil
            self.tableViewHeight.constant = 50.0
            self.isButtonClicked = true
            Localstore.shared.insideCorners = ""
            Localstore.shared.insideCornersArray = []
        }
        
        yesButton.actionBlock {
            self.checkValue = true
            self.setUI()
            self.changeColor(self.yesButton, self.noButton)
            self.isButtonClicked = true
        }
    }

    //MARK: Button Action
    @IBAction func yesButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func noButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if isButtonClicked {
            if checkValue {
                if textFeild.text?.count != 0 {
                    if tableView.isHidden == false {
                        savedata()
                        makeJson()
                    }
                } else {
                    SVProgressHUD.showError(withStatus: Constants.corner_Inside_Value)
                }
            } else {
                pushControl()
            }
        } else {
            SVProgressHUD.showError(withStatus: Constants.select_option)
        }
        
    }
    
    func pushControl() {
        navigationController?.pushViewController(LedgerControl.control, animated: true)
    }
    
    //Calculations
    func makeJson() {
        let count:Int = cellCount
        var dic = [String : Int]()
        var jsonArray = [[String: Int]] ()
        
        if cellCount != 0 {
            for i in 0...count-1 {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.cellForRow(at: indexPath) as! WrappingDoorCell
                
                if cell.widthTextField.text?.count != 0 {
                    if cell.heightTextfield.text == "" {
                        dic = (["Feet": Int(cell.widthTextField.text!) , "Inches": 0] as! [String : Int])
                        feet = Double(cell.widthTextField.text!)!
                    } else {
                        dic = (["Feet": Int(cell.widthTextField.text!) , "Inches": Int(cell.heightTextfield.text!)] as! [String : Int])
                        value1 = Int(cell.widthTextField.text!)! * 12
                        finalInches = value1 + Int(cell.heightTextfield.text!)!
                        feet = Double(finalInches)/12.0
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
                Localstore.shared.insideCorners = "\(totalFeet)"
                Localstore.shared.insideCornersArray = jsonArray
                pushControl()
            }
        } else {
            Localstore.shared.insideCorners = ""
            Localstore.shared.insideCornersArray = []
        }
    }
    
    func savedata() {
        var base = UserStore.sharedInsatnce.baseModel
        base?.noOfInsideCorners = self.textFeild.text
        UserStore.sharedInsatnce.baseModel = base
    }

    func adjustHeightOfTableview() {
        view.layoutIfNeeded()
        tableViewHeight.constant = CGFloat(45 * Int(textFeild.text!)!)
    }

    //MARK:- TEXTFIELD DELEGATE
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(self.textFeild.text?.isEmpty)! {
            if textFeild.text != "0" && textFeild.text != "00" && textFeild.text != "000"{
            if  Int(textFeild.text!)!  < 101 {
                cellCount = Int(textFeild.text!)!
                tableView.isHidden = false
                tableView.reloadData()
                adjustHeightOfTableview()
                }else{
                     SVProgressHUD.showError(withStatus: Constants.corner_Max_Value_Count)
                }
            }
        }else {
            tableViewHeight.constant = 50
            tableView.isHidden = true
        }
    }
}
