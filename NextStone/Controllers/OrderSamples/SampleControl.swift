//
//  SampleControl.swift
//  NextStone
//
//  Created by Mobile on 10/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import SafariServices

class SampleControl: AbstractControl{

    var theBool: Bool = false
    var myTimer: Timer!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Order Samplle Button Action
    @IBAction func orderButtonClicked(_ sender: Any) {
        let linkURL = URL(string:"https://www.nextstone.com/order-samples")!
        UIApplication.visibleViewController.present(SFSafariViewController(url: linkURL), animated: true, completion: nil)
    }
    
    @IBAction func dealerButtonClicked(_ sender: Any) {
        self.navigationController?.pushViewController(DelaerControl.control, animated: true)
    }
    
}
