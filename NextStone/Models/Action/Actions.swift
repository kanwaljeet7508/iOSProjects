//
//  Actions.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

/*
 ActionShowHome to set Home  as root controller
 */
class ActionShowHome {
    
    class func execute() {
        UIApplication.appWindow.rootViewController = UIStoryboard.main.instantiateViewController(withIdentifier: "HomeNavController")
    }
}

/*
 ActionShowLogin to set show slider menu as root controller
 */
class ActionShowSliderMenu {
    
    class func execute() {
        let control = UIStoryboard.main.instantiateViewController(withIdentifier: "UISideMenuNavigationController")
        control.modalPresentationStyle = .fullScreen
        UIApplication.visibleViewController.present(control, animated: true, completion: nil)
    }
}

/*
 ActionBack to dismiss or pop the view controller
 */
class ActionBack {
    
    class func execute() {
        UIApplication.visibleViewController.popOrDismissViewController(true)
    }
}


