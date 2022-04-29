//
//  ForgotPasswordControl.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
class ForgotPasswordControl: AbstractControl {
    
    //MARK:- IBOutlets
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextFieldWithIcon!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.iconType = .image
        emailTextField.iconImage = #imageLiteral(resourceName: "email")
    }
    
    //MARK:- FUNCTIONS
    func checkTextFieldData(_ completion: @escaping (_ :Bool) -> Void) {
        if (emailTextField.text?.isEmpty)!{
            SVProgressHUD.showError(withStatus: Constants.empty_email)
            completion(false)
            return
        }
        
        if !((emailTextField.text?.isEmail())!){
            SVProgressHUD.showError(withStatus: Constants.invalid_email)
            completion(false)
            return
        }
        
        completion(true)
    }
    
    //MARK: Api Call
    func requestForgotPassword(_ email: String){
        UserStore.sharedInsatnce.requestForgotPassword(email) { (status, message) in
            if status == 1 {
                self.emailTextField.text = ""
                SVProgressHUD.showSuccess(withStatus: message)
            }
        }
    }
    
    //MARK:- BUTTON ACTIONS
    @IBAction func submittButton(_ sender: UIButton) {
        checkTextFieldData { (success) in
            if success{
                self.emailTextField.resignFirstResponder()
                self.requestForgotPassword(self.emailTextField.text!)
            }
        }
    }
}
