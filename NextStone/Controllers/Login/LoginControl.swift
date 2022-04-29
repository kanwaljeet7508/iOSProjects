//
//  LoginControl.swift
//  NextStone
//
//  Created by Mobile on 28/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class LoginControl: AbstractControl, GIDSignInUIDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextFieldWithIcon!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserLocation()
        setUI()
    }
    
    //MARK:- FUNCTIONS
    func setUI(){
        GIDSignIn.sharedInstance().uiDelegate = self
        emailTextField.iconType = .image
        emailTextField.iconImage = #imageLiteral(resourceName: "email")
        passwordTextField.iconType = .image
        passwordTextField.iconImage = #imageLiteral(resourceName: "password")
        passwordTextField.isSecureTextEntry = true
    }
    
    // to check if the textfields are empty or not
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
        
        if (passwordTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.password_empty)
            completion(false)
            return
        }
        completion(true)
    }
    
    // login with model
    func requestLogin(_ login: Login){
        print("login: ",login)
        UserStore.sharedInsatnce.requestLogin(login) { (status, userId, message) in
            if status == 1{
                UserStore.sharedInsatnce.userId = userId
                SVProgressHUD.showSuccess(withStatus: message)
                ActionShowHome.execute()
            }
        }
    }
    
    //MARK:- BUTTON ACTIONS
    
    //Login Button
    @IBAction func loginButton(_ sender: UIButton) {
        checkTextFieldData{ (success) in
            if success{
                let login = Login()
                login.email = self.emailTextField.text
                login.password = self.passwordTextField.text
                login.loginType = .web
                login.socialId = ""
                self.requestLogin(login)
            }
        }
    }
    
    //Forgot Password
    @IBAction func forgotPassword(_ sender: UIButton) {
        navigationController?.pushViewController(ForgotPasswordControl.control, animated: true)
    }
    
    //Facebook Login
    @IBAction func facebookLoginButton(_ sender: UIButton) {
        FacebookStore.shared.logout()
        FacebookStore.shared.requestLoginModel { (login) in
            if login != nil {
                let facebookLogin = Login()
                facebookLogin.email = login?.email
                facebookLogin.loginType = (login?.loginType)!
                facebookLogin.socialId = login?.socialId
                facebookLogin.latitude = user_Current_latitude
                facebookLogin.longitude = user_Current_longitude
                facebookLogin.address = user_Address
                facebookLogin.country = user_country
                facebookLogin.state = user_State
                facebookLogin.city = user_City
                self.requestLogin(facebookLogin)
            }
        }
    }
    
    //Google Login
    @IBAction func googleLoginButton(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
        GoogleStore.shared.requestUserDetail { (login) in
            GIDSignIn.sharedInstance().signOut()
            if login != nil {
                let googleLogin = Login()
                googleLogin.email = login?.email
                googleLogin.loginType = (login?.loginType)!
                googleLogin.socialId = login?.socialId
                googleLogin.latitude = user_Current_latitude
                googleLogin.longitude = user_Current_longitude
                googleLogin.address = user_Address
                googleLogin.country = user_country
                googleLogin.state = user_State
                googleLogin.city = user_City
                self.requestLogin(googleLogin)
            }
        }
    }
    
    //SignUp Button
    @IBAction func signupButton(_ sender: UIButton) {
        navigationController?.pushViewController(SignUpControl.control, animated: true)
    }
    
    //MARK:- MISC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
