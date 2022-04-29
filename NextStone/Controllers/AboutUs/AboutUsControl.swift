//
//  AboutUsControl.swift
//  NextStone
//
//  Created by Mobile on 10/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import WebKit

class AboutUsControl: AbstractControl , WKUIDelegate, WKNavigationDelegate{

    //MARK: IBOutlets
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var myProgressView: UIProgressView!
    
    //MARK: Variables
    var theBool: Bool = false
    var myTimer: Timer!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webKitView.uiDelegate = self
        self.webKitView.navigationDelegate = self
        let urlRequest = URLRequest(url: URL(string: APIS.ABOUT_US)!)
        self.webKitView.load(urlRequest)
        funcToCallWhenStartLoadingYourWebview()
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

    //NARK:- MISC
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

