//
//  LeftSliderControl.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import SideMenu
import GoogleSignIn
import Google

class LeftSliderControl: AbstractControl {
    
    @IBOutlet weak var leftSliderTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
//    let stringArray = ["About Us", "Material Calculator", "Product Specifications", "My Material Lists", "How to order samples", "Where to buy", "How to Videos", "Gallery", "Contact Us","360 Images"]
//    let stringArray = ["About Us", "Material Calculator", "Product Specifications", "My Material Lists", "How to order samples", "Where to buy", "How to Videos", "Gallery", "Contact Us"]
    let stringArray = ["About Us", "Material Calculator", "My Material Lists", "Product Specifications","360 Images", "Order Samples", "Where to buy", "How to Videos", "Gallery", "Contact Us"]

    let imageArray = [#imageLiteral(resourceName: "about"), #imageLiteral(resourceName: "material"),#imageLiteral(resourceName: "gray_pdf"), #imageLiteral(resourceName: "product_specification"),#imageLiteral(resourceName: "how"), #imageLiteral(resourceName: "where"), #imageLiteral(resourceName: "contat"), #imageLiteral(resourceName: "how_video"), #imageLiteral(resourceName: "gellery"), #imageLiteral(resourceName: "how")]
    let imageWhiteArray = [#imageLiteral(resourceName: "about_white"), #imageLiteral(resourceName: "material_white"), #imageLiteral(resourceName: "white_pdf"),#imageLiteral(resourceName: "product_specification_white"),#imageLiteral(resourceName: "how_white"), #imageLiteral(resourceName: "where_white"), #imageLiteral(resourceName: "contat_white"), #imageLiteral(resourceName: "how_video_white"), #imageLiteral(resourceName: "gellery_white"), #imageLiteral(resourceName: "how_white")]
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 10.0
        SideMenuManager.default.menuFadeStatusBar = false
        //register cell xib
        let cellXib = UINib(nibName: "LeftSliderCell", bundle: nil)
        leftSliderTableView.register(cellXib, forCellReuseIdentifier: "LeftSliderCell")
    }
    
    func setControl(_ viewControl: UIViewController) {
        dismiss(animated: true, completion: nil)
        let control = (presentingViewController as! UINavigationController)
        control.setViewControllers([viewControl], animated: false)
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        UserStore.sharedInsatnce.userId = ""
        Localstore.shared.lastSelectedTableViewCell = nil
        FacebookStore.shared.logout()
        GIDSignIn.sharedInstance().signOut()
        setControl((storyboard?.instantiateViewController(withIdentifier: "LoginControl"))!)
    }
}
