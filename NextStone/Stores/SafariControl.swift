//
//  SFSafariViewController.swift
//  ArtTime
//
//  Created by Mac on 09/08/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit
import SafariServices

class SafariControl {
    
    class func openURL(_ youtubeId: String) {
        let youtubeUrl = URL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
        UIApplication.visibleViewController.present(SFSafariViewController(url: youtubeUrl), animated: true, completion: nil)
    }
    
    class func openLink(_ Link: String) {
        let linkURL = URL(string:"\(Link)")!
        UIApplication.visibleViewController.present(SFSafariViewController(url: linkURL), animated: true, completion: nil)
    }
}


