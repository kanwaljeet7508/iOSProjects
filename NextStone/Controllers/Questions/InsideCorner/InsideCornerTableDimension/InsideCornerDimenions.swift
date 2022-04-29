//
//  InsideCornerDimenions.swift
//  NextStone
//
//  Created by User on 25/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class InsideCornerDimenions: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet weak var insideCornerTF: UITextField!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var insideCornerTV: UITableView!
    
    //MARK: Variables
    var cellCount = 0
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        insideCornerTF.addBorder(Constants.THEME_COLOR)
        insideCornerTV.layer.borderColor = Constants.THEME_COLOR.cgColor
        insideCornerTV.layer.borderWidth = 1.0
        insideCornerTV.backgroundColor = .clear
        insideCornerTV.isHidden = true
        self.insideCornerTV.separatorStyle = .none
        setUI()
        
        //register tableview cell
        let nib = UINib(nibName: "WrappingDoorCell", bundle: nil)
        insideCornerTV.register(nib, forCellReuseIdentifier: "WrappingDoorCell")
        
        //footerView
        let xib = UINib(nibName: "WrappingDoorFooter", bundle: nil)
        insideCornerTV.register(xib, forHeaderFooterViewReuseIdentifier: "WrappingDoorFooter")
        
    }

    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
    }

    //MARK:- FUNCTIONS
    //FUNC SETUI
    func setUI() {
        insideCornerTF.delegate = self
    }
    
    func adjustHeightOfTableview() {
        view.layoutIfNeeded()
        tableviewHeight.constant = CGFloat(45 * Int(insideCornerTF.text!)!)
    }

    //MARK: Button Actions
    //Back Button
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Next Button
    @IBAction func nextButtonClicked(_ sender: Any) {
        if insideCornerTF.text?.count != 0 {
            makeJson()
            savedata()
        } else {
            SVProgressHUD.showError(withStatus: Constants.corner_Inside)
        }
    }
    
    //MARK: Push Control
    func pushControl() {
        navigationController?.pushViewController(TransitionControl.control, animated: true)
    }
    
    //Calculations
    func makeJson() {
        let count:Int = cellCount
        var dic = [String : Int]()
        var jsonArray = [[String: Int]] ()

        if cellCount != 0 {
            for i in 0...count-1 {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = insideCornerTV.cellForRow(at: indexPath) as! WrappingDoorCell
                
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
    
    //MARK: Save Data
    func savedata() {
        var base = UserStore.sharedInsatnce.baseModel
        base?.noOfInsideCorners = self.insideCornerTF.text
        UserStore.sharedInsatnce.baseModel = base
    }
    
    //MARK: TextFeild Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(insideCornerTF.text?.isEmpty)! {
            if insideCornerTF.text != "0" && insideCornerTF.text != "00" && insideCornerTF.text != "000"{
                if  Int(insideCornerTF.text!)!  < 101 {
                    cellCount = Int(insideCornerTF.text!)!
                    insideCornerTV.isHidden = false
                    insideCornerTV.reloadData()
                    adjustHeightOfTableview()
                }else{
                     SVProgressHUD.showError(withStatus: Constants.corner_Max_Value_Count)
                }
            }
        } else {
            tableviewHeight.constant = 50
            insideCornerTV.isHidden = true
        }
    }
}
