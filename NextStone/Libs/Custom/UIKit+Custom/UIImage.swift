//
//  UIImage.swift
//  FreshMeatMarket
//
//  Created by Lakhwinder Singh on 12/04/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit
extension UIImage {

    class func classImage(_ control: UIViewController) -> UIImage {
        print(String(describing: control))
        return UIImage(named: "\(String(describing: control)).png")!
    }
}


