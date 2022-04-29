//
//  DimensionControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 07/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class DimensionControl: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet var popImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var dimensionWidth = 0.0
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        let nib = UINib(nibName: "DoorWindowCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DoorWindowCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        totalFeet = 0.0
        dimensionWidth = 0.0
    }

    //MARK:- BUTTON ACTIONS
    //Back Button
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    //Next Button
    @IBAction func nextButton(_ sender: UIButton) {
        makeJson()
    }
    
    //Calculations
    func makeJson() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! DoorWindowCell
        
        if (cell.feetWidthTF.text?.count != 0) && (cell.feetHeightTF.text?.count != 0) {
            if cell.inchesWidthTF.text == "" {
                if cell.inchesHeightTF.text == "" {
                    value1 = Int(cell.feetWidthTF.text!)! * 12
                    value2 = Int(cell.feetHeightTF.text!)! * 12
                    finalInches = value1 * value2
                    feet = Double(finalInches)/144.0
                    dimensionWidth = Double(value1)/12.0
                } else {
                    value1 = Int(cell.feetWidthTF.text!)! * 12
                    value2 = Int(cell.feetHeightTF.text!)! * 12
                    finalInches = value1 * (value2 + Int(cell.inchesHeightTF.text!)!)
                    feet = Double(finalInches)/144.0
                    dimensionWidth = Double(value1)/12.0
                }
            } else if cell.inchesHeightTF.text == "" {
                value1 = Int(cell.feetWidthTF.text!)! * 12
                value2 = Int(cell.feetHeightTF.text!)! * 12
                finalInches = (value1 + Int(cell.inchesWidthTF.text!)!) * value2
                feet = Double(finalInches)/144.0
                dimensionWidth = Double(value1 + Int(cell.inchesWidthTF.text!)!)/12.0
            }
            else {
                value1 = Int(cell.feetWidthTF.text!)! * 12
                value2 = Int(cell.feetHeightTF.text!)! * 12
                finalInches = (value1 + Int(cell.inchesWidthTF.text!)!) *  (Int(cell.inchesHeightTF.text!)! + value2)
                feet = Double(finalInches)/144.0
                dimensionWidth = Double(value1 + Int(cell.inchesWidthTF.text!)!)/12.0
            }
            totalFeet = totalFeet + feet
            print("TotalFeet : \(totalFeet) , DimensionWidth : \(dimensionWidth)")
            saveData(totalFeet , dimensionWidth)
        } else {
            SVProgressHUD.showError(withStatus: "Please fill all the fields")
        }
    }
    
    //MARK: Save Data
    func saveData(_ totalFeet : Double , _ widthDimension : Double) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.totalSquareArea = "\(totalFeet)"
        base?.dimentionHeightInFeet = "\(widthDimension)"
        UserStore.sharedInsatnce.baseModel = base
        self.navigationController?.pushViewController(DoorWrapControl.control, animated: true)
    }
}
