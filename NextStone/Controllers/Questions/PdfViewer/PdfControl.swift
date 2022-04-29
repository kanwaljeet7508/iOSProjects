//
//  PdfControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 22/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import WebKit

var boolValue = Bool()

class PdfControl: AbstractControl , WKUIDelegate, WKNavigationDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var correctBackView: UIView!
    
    //MARK: Variables
    var theBool: Bool = false
    var myTimer: Timer!
    var pdfId = String()

    //MARK:- CLASS FUNCTIONS
    class func control(_ pdfId: String) -> PdfControl {
        let control = self.control as! PdfControl
        control.pdfId = pdfId
        return control
    }
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webKitView.uiDelegate = self
        self.webKitView.navigationDelegate = self
        let urlRequest = URLRequest(url: URL(string: "\(APIS.PDF_FILE)\(pdfId).pdf")!)
        self.webKitView.load(urlRequest)
        funcToCallWhenStartLoadingYourWebview()
    }
    
    //MARK: View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        if boolValue {
            correctBackView.isHidden = true
            boolValue = false
        } else {
            correctBackView.isHidden = false
        }
    }

    //MARK: Functions
    func funcToCallWhenStartLoadingYourWebview() {
        self.myProgressView?.progress = 0.0
        self.theBool = false
        if self.myTimer != nil {
            self.myTimer.invalidate()
        }
        self.myTimer = Timer.scheduledTimer(timeInterval: 0.01667, target: self, selector: #selector(self.timerCallback), userInfo: nil, repeats: true)
    }
    
    func funcToCallCalledWhenUIWebViewFinishesLoading() {
        self.theBool = true
    }
    
    @objc func timerCallback() {
        if self.theBool {
            if (self.myProgressView?.progress)! >= Float(1.0) {
                self.myProgressView?.isHidden = true
                self.myTimer.invalidate()
            } else {
                self.myProgressView?.progress += 0.01
            }
        } else {
            self.myProgressView?.progress += 0.001
            if (self.myProgressView?.progress)! >= Float(0.95) {
                self.myProgressView?.progress = 0.95
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        funcToCallCalledWhenUIWebViewFinishesLoading()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        funcToCallWhenStartLoadingYourWebview()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        funcToCallCalledWhenUIWebViewFinishesLoading()
    }

    //MARK: Button Action
    //Email Button Clicked
    @IBAction func emailButtonClicked(_ sender: Any) {
        if let myWebsite = NSURL(string: "\(APIS.PDF_FILE)\(pdfId).pdf") {
            let objectsToShare = [myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            self.present(activityVC, animated: true, completion: nil)
        }

    }

    //PrintButtonClicked
    @IBAction func printButtonClicked(_ sender: Any) {
        let printPDF = URL(string: "\(APIS.PDF_FILE)\(pdfId).pdf")!
        if UIPrintInteractionController.canPrint(printPDF) {
            let printInfo = UIPrintInfo(dictionary: nil)
            printInfo.jobName = printPDF.lastPathComponent
            printInfo.outputType = .photo
            let printController = UIPrintInteractionController.shared;
            printController.printInfo = printInfo
            printController.showsNumberOfCopies = false
            printController.printingItem = printPDF
            printController.present(animated: true, completionHandler: nil)
        }
    }
    
    //SaveButtonClicked
    @IBAction func saveButtonClicked(_ sender: Any) {
        
    }
    
    //SubmitButtonClicked
    @IBAction func submitButtonClicked(_ sender: Any) {
        correctBackView.isHidden = true
    }
    
    //Edit Button Clicked
    @IBAction func editButtonClicked(_ sender: Any) {
        PdfStore.sharedInstance.deletePdfFile(pdfId) { (flag) in
            if flag {
                self.navigationController?.pushViewController(MaterialControl.control, animated: true)
            } else {
                UIAlertController.showAlert("NextStone", message: "Some Error Occured", buttons: ["Ok"], completion: nil)
            }
        }
    }
    
    //MARK:- MISC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
