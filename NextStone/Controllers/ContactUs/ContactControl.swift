//
//  ContactControl.swift
//  NextStone
//
//  Created by Mobile on 05/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class ContactControl: AbstractControl {

    //MARK:- IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK :- VIEW WILL DISAPPEAR
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    //MARK:- FUCNTIONS
    func setUI(){
        let textfields = [emailTextField,phoneNumberTextField,subjectTextField]
        for textfields in textfields{
            textfields?.addBorder(Constants.THEME_COLOR)
        }
        phoneNumberTextField.delegate = self
        messageTextView.layer.borderColor = Constants.THEME_COLOR.cgColor
        messageTextView.layer.borderWidth = 0.5
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
        
        if (phoneNumberTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.phone_empty)
            completion(false)
            return
        }
        
        if (subjectTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.subject_empty)
            completion(false)
            return
        }
        
        if (messageTextView.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.empty_messageField)
            completion(false)
            return
        }
        completion(true)
    }
    
    //Clear textField data
    func clearTextFields(){
        let textfield = [emailTextField, phoneNumberTextField, subjectTextField]
        for textfield in textfield{
            textfield?.text = ""
        }
        
        messageTextView.text = ""
        self.messageTextView.resignFirstResponder()
    }
    
    //api
    func contactWithModel(_ contact: Contact){
        UserStore.sharedInsatnce.requestContact(contact, completion: { (status, message) in
            if status == 1{
                self.clearTextFields()
                SVProgressHUD.showSuccess(withStatus: "Message sent")
            }
        })
    }
    
    //MARK:- BUTTON ACTIONS
    @IBAction func sendButton(_ sender: UIButton) {
        self.view.resignFirstResponder()
        checkTextFieldData { (success) in
            if success{
                let contact = Contact()
                contact.email = self.emailTextField.text
                contact.phone = self.phoneNumberTextField.text
                contact.subject = self.subjectTextField.text
                contact.message = self.messageTextView.text
                self.contactWithModel(contact)
            }
        }
    }
    
    //MARK:- MISC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK:- TEXT FIELD DELEGATE
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if phoneNumberTextField == textField {
            let nsString = textField.text as NSString?
            let newString = nsString?.replacingCharacters(in: range, with: string)
            return (newString?.validPhoneNo)!
        }
        return false
    }
}
