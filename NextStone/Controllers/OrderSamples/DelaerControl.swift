//
//  DelaerControl.swift
//  NextStone
//
//  Created by Mobile on 12/06/19.
//  Copyright © 2019 Hakikat Singh. All rights reserved.
//

import UIKit

class DelaerControl: AbstractControl {

    //MARK:- IBOutlets
    @IBOutlet weak var txtFeild_Name: TextField!
    @IBOutlet weak var txtFeild_PhoneNumber: TextField!
    @IBOutlet weak var txtFeild_Company: TextField!
    @IBOutlet weak var txtFeild_Address: TextField!
    @IBOutlet weak var txtView_Body: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        let textfields = [txtFeild_Name,txtFeild_PhoneNumber,txtFeild_Company,txtFeild_Address]
        for textfields in textfields{
            textfields?.addBorder(Constants.THEME_COLOR)
        }
        txtFeild_PhoneNumber.delegate = self
        txtView_Body.layer.borderColor = Constants.THEME_COLOR.cgColor
        txtView_Body.layer.borderWidth = 0.5
    }

    // to check if the textfields are empty or not
    func checkTextFieldData(_ completion: @escaping (_ :Bool) -> Void) {
        if (txtFeild_Name.text?.isEmpty)!{
            SVProgressHUD.showError(withStatus: Constants.name_empty)
            completion(false)
            return
        }
        
        if (txtFeild_PhoneNumber.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.phone_empty)
            completion(false)
            return
        }
        
        if (txtFeild_Company.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.empty_CompanyNameField)
            completion(false)
            return
        }
        
        if (txtFeild_Address.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.empty_AddressField)
            completion(false)
            return
        }
        
        if (txtView_Body.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: Constants.empty_messageField)
            completion(false)
            return
        }

        completion(true)
    }
    
    //Clear textField data
    func clearTextFields(){
        let textfield = [txtFeild_Name,txtFeild_PhoneNumber,txtFeild_Company,txtFeild_Address]
        for textfield in textfield{
            textfield?.text = ""
        }
        txtView_Body.text = ""
        self.txtView_Body.resignFirstResponder()
    }
    
    //api
    func dealerWithModel(_ dealer: DealerForm){
        
        UserStore.sharedInsatnce.requestDealer(dealer, completion: { (status, message) in
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
                let dealer = DealerForm()
                dealer.name = self.txtFeild_Name.text
                dealer.phone = self.txtFeild_PhoneNumber.text
                dealer.company = self.txtFeild_Company.text
                dealer.address = self.txtFeild_Address.text
                dealer.subject = self.txtView_Body.text
                self.dealerWithModel(dealer)
            }
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- TEXT FIELD DELEGATE
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if txtFeild_PhoneNumber == textField {
            let nsString = textField.text as NSString?
            let newString = nsString?.replacingCharacters(in: range, with: string)
            return (newString?.validPhoneNo)!
        }
        return false
    }



}
