//
//  OutsideCornersTable.swift
//  NextStone
//
//  Created by User on 22/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class OutsideCornersTable: AbstractControl  {

    //MARK: IBOutlets
    @IBOutlet weak var cornersTV: UITableView!
    @IBOutlet weak var cornerTF: UITextField!
    @IBOutlet weak var cornerTVHeight: NSLayoutConstraint!
    @IBOutlet weak var footerImageView: UIImageView!
    
    var cellCount = 0
    var nameId : String!

    class func controlWithName(_ name: String!) -> OutsideCornersTable {
        let control = self.control as! OutsideCornersTable
        control.nameId = name
        return control
    }
    
    //MARK: View App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch nameId {
        case "0":
            footerImageView.image = #imageLiteral(resourceName: "03")
        case "1":
            footerImageView.image = #imageLiteral(resourceName: "02")
        case "2":
            footerImageView.image = #imageLiteral(resourceName: "05")
        default:
            break
        }
        cornersTV.backgroundColor = .clear
        cornerTF.addBorder(Constants.THEME_COLOR)
        cornersTV.layer.borderColor = Constants.THEME_COLOR.cgColor
        cornersTV.layer.borderWidth = 1.0
        cornersTV.isHidden = true
        self.cornersTV.separatorStyle = .none
        setUI()
        //register tableview cell
        let nib = UINib(nibName: "WrappingDoorCell", bundle: nil)
        cornersTV.register(nib, forCellReuseIdentifier: "WrappingDoorCell")
        
        //footerView
        let xib = UINib(nibName: "WrappingDoorFooter", bundle: nil)
        cornersTV.register(xib, forHeaderFooterViewReuseIdentifier: "WrappingDoorFooter")

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
    }

    //MARK:- FUNCTIONS
    
    //FUNC SETUI
    func setUI() {
        cornerTF.delegate = self
    }
    
    //MARK: Height Adjustment of TableView
    func adjustHeightOfTableview() {
        view.layoutIfNeeded()
        cornerTVHeight.constant = CGFloat(45 * Int(cornerTF.text!)!) //cornersTV.contentSize.height
    }
    
    //MARK: Button Action
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if cornerTF.text?.count != 0 {
            makeJson()
            savedata()
        } else {
            SVProgressHUD.showError(withStatus: Constants.corner_outside)
        }
    }
    
    //MARK: Push Control
    func pushControl() {
        navigationController?.pushViewController(InsideCornerControl.control, animated: true)
    }
    
    //MARK: Json File
    func makeJson(){
        let count:Int = cellCount
        var dic = [String : Int]()
        var jsonArray = [[String: Int]] ()

        if cellCount != 0 {
            for i in 0...count-1 {
                let indexPath = IndexPath(row: i, section: 0)
                let cell = cornersTV.cellForRow(at: indexPath) as! WrappingDoorCell
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
                Localstore.shared.outsideCorners = "\(totalFeet)"
                Localstore.shared.outsideCornersArray = jsonArray
                pushControl()
            }
        } else {
            Localstore.shared.outsideCorners = ""
            Localstore.shared.outsideCornersArray = []
        }
    }
    
    //MARK:- Save Outside Corners
    func savedata() {
        var base = UserStore.sharedInsatnce.baseModel
        base?.noOfOutsideCorners = self.cornerTF.text
        UserStore.sharedInsatnce.baseModel = base
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return textField.text!.length < 3
//    }

    //MARK: Textfield Delegates
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(cornerTF.text?.isEmpty)! {
            if cornerTF.text != "0" && cornerTF.text != "00" && cornerTF.text != "000" {
                if  Int(cornerTF.text!)!  < 101 {
                    cellCount = Int(cornerTF.text!)!
                    cornersTV.isHidden = false
                    cornersTV.reloadData()
                    adjustHeightOfTableview()
                }else{
                     SVProgressHUD.showError(withStatus: Constants.corner_Max_Value_Count)
                }
            }
        } else {
            cornerTVHeight.constant = 50
            cornersTV.isHidden = true
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
