
//
//  SubmitControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 11/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class SubmitControl: AbstractControl {
    /*
     electrical outlets
     */
    @IBOutlet weak var electricalAnswerTextField: UITextField!
    @IBOutlet weak var electricalHeight: NSLayoutConstraint!
    @IBOutlet weak var addressHeight: NSLayoutConstraint!
    @IBOutlet weak var electricalYesButton: UIButton!
    @IBOutlet weak var electricalNoButton: UIButton!
    @IBOutlet weak var electricalView: UIView!
    
    /*
     Submit PopUp
     */
    @IBOutlet weak var fileNameTextField: UITextField!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var blurView: UIView!
    
    /*
     Name plate
     */
    @IBOutlet weak var plateAnswerTextField: UITextField!
    @IBOutlet weak var addressPlateView: UIView!
    @IBOutlet weak var plateYesButton: UIButton!
    @IBOutlet weak var plateNoButton: UIButton!
    @IBOutlet var tutImageView: UIImageView!
    
    //MARK: Variables
    var electricalAnswer: Bool = false
    var electricalCheck: Bool = false
    var plateAnswer: Bool = false
    var plateCheck: Bool = false
    var base = UserStore.sharedInsatnce.baseModel
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        electricalAnswerTextField.addBorder(Constants.THEME_COLOR)
        plateAnswerTextField.addBorder(Constants.THEME_COLOR)

        let view = [electricalView, addressPlateView]
        for view in view {
            view?.layer.borderColor = Constants.THEME_COLOR.cgColor
            view?.layer.borderWidth = 1.0
        }
        
        let buttons = [electricalNoButton, electricalYesButton, plateYesButton, plateNoButton]
        for button in buttons {
            button?.layer.borderWidth = 1.0
            button?.layer.borderColor = Constants.THEME_COLOR.cgColor
        }
    }
    
    //MARK:- FUNCTIONS
    func check(_ completion: @escaping (_ :Bool) -> Void) {
        if electricalCheck == false{
            SVProgressHUD.showError(withStatus: Constants.electrical_outlets)
            completion(false)
            return
        }
        
        if electricalAnswer == true {
            if electricalAnswerTextField.text?.count == 0 {
                SVProgressHUD.showError(withStatus: Constants.electrical_outlets_empty)
                completion(false)
                return
            }
        }
        
        if plateCheck == false {
            SVProgressHUD.showError(withStatus: Constants.address_plaque)
            completion(false)
            return
        }
        
        if plateAnswer == true {
            if plateAnswerTextField.text?.count == 0 {
                SVProgressHUD.showError(withStatus: Constants.address_plaque_empty)
                completion(false)
                return
            }
        }
        completion(true)
    }
    
    //MARK:- BUTTON ACTIONS
    /*
     electrical outlets
     */
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func electricalYesButton(_ sender: UIButton) {
        self.changeColor(electricalYesButton, electricalNoButton)
        electricalCheck = true
        electricalAnswer = true
        base?.electricalOutletStatus = 1
        UserStore.sharedInsatnce.baseModel = base
        showHideElectical(true)
    }
    
    @IBAction func electricalNoButton(_ sender: UIButton) {
        self.changeColor(electricalNoButton, electricalYesButton)
        electricalCheck = true
        electricalAnswer = false
        base?.electricalOutletStatus = 0
        UserStore.sharedInsatnce.baseModel = base
        showHideElectical(false)
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        if (fileNameTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: "FileName is empty.")
        } else {
            showHideMore(false)
            MaterialCalculatorStore.sharedInstance.requestSubmitQuestion((fileNameTextField.text)!, completion: { (id, message) in
                if id != "0" {
                    SVProgressHUD.showSuccess(withStatus: Constants.answer_submitt)
                    self.navigationController?.pushViewController(PdfControl.control(id), animated: true)
                }
            })
        }
    }
    
    //Animation View
    func showHideMore(_ show: Bool) {
        blurView.transform = CGAffineTransform(scaleX: show ? 0.1 : 1.0, y: show ? 0.1 : 1.0)
        popUpView.setHidden(false, animated: false)
        UIView.animate(withDuration: 0.4, animations: {
            self.blurView.transform = CGAffineTransform(scaleX: show ? 1.0 : 0.1, y: show ? 1.0 : 0.1)
        }, completion: { (completed) in
            self.popUpView.setHidden(!show, animated: false)
        })
    }
    
    /*
     MARK:- Name plate
     */
    @IBAction func plateYesButton(_ sender: UIButton) {
        self.changeColor(plateYesButton, plateNoButton)
        plateCheck = true
        plateAnswer = true
        base?.lightFixtureStatus = 1
        UserStore.sharedInsatnce.baseModel = base
        showHideAddress(true)
    }
    
    @IBAction func plateNoButton(_ sender: UIButton) {
        self.changeColor(plateNoButton, plateYesButton)
        plateCheck = true
        plateAnswer = false
        base?.lightFixtureStatus = 0
        UserStore.sharedInsatnce.baseModel = base
        showHideAddress(false)
    }
    
    func showHideElectical(_ show: Bool) {
        electricalHeight.constant = show ? 50 : 0
        electricalView.isHidden = !show
        view.layoutIfNeeded()
    }
    
    func showHideAddress(_ show: Bool) {
        addressHeight.constant = show ? 50 : 0
        addressPlateView.isHidden = !show
        view.layoutIfNeeded()
    }
    
    //Submit Button Clicked
    @IBAction func submitButton(_ sender: UIButton) {
        check { (success) in
            if success {
                if self.electricalAnswer {
                    self.base?.noOfElectricalOutlets = self.electricalAnswerTextField.text!
                    UserStore.sharedInsatnce.baseModel = self.base
                }
                if self.plateAnswer {
                    self.base?.noOfLightFixtures = self.plateAnswerTextField.text!
                    UserStore.sharedInsatnce.baseModel = self.base
                }
                self.blurView.isHidden = false
                self.showHideMore(true)
            }
        }
    }
}
