//
//  UIButton.swift
//
//  Created by Lakhwinder Singh on 01/08/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit

extension UIButton {
    
    var image: UIImage {
        get {
            return image(for: .normal)!
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setButtonBorder(){
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
    }
    
    func roundCorner() {
        self.layer.cornerRadius = 10.0
    }
    
    func hasImage(named imageName: String, for state: UIControlState) -> Bool {
        guard let buttonImage = image(for: state), let namedImage = UIImage(named: imageName) else {
            return false
        }
        return UIImagePNGRepresentation(buttonImage) == UIImagePNGRepresentation(namedImage)
    }
}


