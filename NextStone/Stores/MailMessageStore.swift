//
//  MailAndMessage.swift
//  Toca
//
//  Created by CSPC162 on 29/12/17.
//  Copyright © 2017 CSPC175. All rights reserved.
//

import UIKit
import MessageUI

class MailMessageStore: NSObject, MFMailComposeViewControllerDelegate {
    
    static let shared = MailMessageStore()
    
    private var completion: ((_ : Bool?) -> Void)? = nil
    
    override private init() {
        super.init()
    }
    
    private func canSendEmail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    func sendEmail(_ emailBody: String, completion: @escaping (_ : Bool?)-> Void) {
        SVProgressHUD.dismiss()
        if self.canSendEmail() {
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            mailComposeVC.setToRecipients([""])
            mailComposeVC.setSubject("Pdf File Report")
            mailComposeVC.setMessageBody(emailBody, isHTML: false)
            self.present(mailComposeVC)
        } else {
            UIAlertController.showAlert("Error", message: "Mail composer not available!", buttons: ["Ok"], completion: nil)
        }
        self.completion = completion
    }
    
    private func present(_ viewController: UIViewController) {
        UIApplication.visibleViewController.present(viewController, animated: true, completion: nil)
    }
    
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        var sucess: Bool!
        switch result {
        case .cancelled:
            sucess = false
            break
        case .sent:
            sucess = true
        case .failed:
            sucess = false
            break
        case .saved:
            sucess = false
            break
        }
        controller.dismiss(animated: true, completion: {
            self.completion!(sucess)
        })
    }
}
