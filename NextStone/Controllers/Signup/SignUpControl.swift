//
//  SignUpControl.swift
//  NextStone
//
//  Created by Mobile on 29/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class SignUpControl: AbstractControl {
    
    @IBOutlet weak var mailTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var confirmPassTextField: SkyFloatingLabelTextFieldWithIcon!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserLocation()
        setUI()
    }
    
    //MARK:- FUNCTIONS
    func setUI(){
        mailTextField.iconType = .image
        mailTextField.iconImage = #imageLiteral(resourceName: "email")
        
        let password = [passTextField, confirmPassTextField]
        for password in password{
            password?.iconType = .image
            password?.iconImage = #imageLiteral(resourceName: "password")
            password?.isSecureTextEntry = true
        }
    }
    
    // to check if the textfields are empty or not
    func checkTextFieldData(_ completion: @escaping (_ :Bool) -> Void) {
        if (mailTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.empty_email)
            completion(false)
            return
        }
        if !((mailTextField.text?.isEmail())!) {
            SVProgressHUD.showError(withStatus: Constants.invalid_email)
            completion(false)
            return
        }
        if (passTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.password_empty)
            completion(false)
            return
        }
        if (passTextField.text?.count)! < 6 {
            SVProgressHUD.showError(withStatus: Constants.password_characters_less)
            completion(false)
            return
        }
        if (confirmPassTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.confirmPassword_empty)
            completion(false)
            return
        }
        if passTextField.text != confirmPassTextField.text {
            SVProgressHUD.showError(withStatus: Constants.password_doesnt_match)
            completion(false)
            return
        }
        completion(true)
    }
    
    //register user with model
    func registerUser(_ register: Register) {
        print("register: ",register)
        UserStore.sharedInsatnce.requestRegisterUser(register) { (status, userId, message) in
            if status == 1{
                UserStore.sharedInsatnce.userId = userId
                SVProgressHUD.showSuccess(withStatus: message)
                ActionShowHome.execute()
            }
        }
    }
    
    //MARK:- BUTTON ACTIONS
    @IBAction func signupButton(_ sender: UIButton) {
        checkTextFieldData { (success) in
            if success{
                let register = Register()
                register.email = self.mailTextField.text!
                register.password = self.passTextField.text!
                register.latitude = user_Current_latitude
                register.longitude = user_Current_longitude
                register.address = user_Address
                register.country = user_country
                register.state = user_State
                register.city = user_City
                self.registerUser(register)
            }
        }
    }
    
    //MARK:-  MISC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
