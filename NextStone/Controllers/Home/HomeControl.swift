//
//  HomeControl.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

enum VersionError: Error {
    case invalidResponse, invalidBundleInfo
}

class HomeControl: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet weak var materialCalculatorButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var aboutUsButton: UIButton!
    @IBOutlet weak var whereToBuyButton: UIButton!
    @IBOutlet weak var howToOrderButton: UIButton!
    @IBOutlet weak var howToVideosButton: UIButton!
    @IBOutlet weak var pdfButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var productSpecificationButton: UIButton!
    @IBOutlet weak var btn_ThreeSixty: UIButton!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = [materialCalculatorButton,contactButton,productSpecificationButton,aboutUsButton,whereToBuyButton,howToOrderButton,howToVideosButton, pdfButton, galleryButton,btn_ThreeSixty]
        for button in button {
            button?.layer.cornerRadius = 10.0
        }
        //Check the version of app in store
        DispatchQueue.global().async {
            do {
                let update = try self.isUpdateAvailable()
                DispatchQueue.main.async {
                    // show alert
                    if update{
                        self.popupUpdateDialogue();
                    }}} catch {
                print(error)
            }
        }
    }
    
    //MARK:- BUTTON ACTIONS
    @IBAction func homeScreenButton(_ sender: UIButton) {
        switch sender.tag {
        case 1://About Us
           Localstore.shared.lastSelectedTableViewCell = 0
           navigationController?.pushViewController(AboutUsControl.control, animated: true)
            return
        case 2://Material Calulator
            Localstore.shared.lastSelectedTableViewCell = 1
            navigationController?.pushViewController(MaterialControl.control, animated: true)
            return
        case 3://PDF List
            Localstore.shared.lastSelectedTableViewCell = 2
            navigationController?.pushViewController(PdfListControl.control, animated: true)
            return
        case 4://Sample order
            Localstore.shared.lastSelectedTableViewCell = 5
            navigationController?.pushViewController(SampleControl.control, animated: true)
            return
        case 5://Where to Buy
            Localstore.shared.lastSelectedTableViewCell = 6
            navigationController?.pushViewController(WhereToBuyControl.control, animated: true)
            return
        case 6://How to Videos
            Localstore.shared.lastSelectedTableViewCell = 7
            navigationController?.pushViewController(HowToVideos.control, animated: true)
            return
        case 7://Gallery
            Localstore.shared.lastSelectedTableViewCell = 8
            navigationController?.pushViewController(GalleryControl.control, animated: true)
            return
        case 8://Contact Us
            Localstore.shared.lastSelectedTableViewCell = 9
            navigationController?.pushViewController(ContactControl.control, animated: true)
            return
        case 9://Product Specification
            Localstore.shared.lastSelectedTableViewCell = 3
            navigationController?.pushViewController(Product_Specifications_Control.control, animated: true)
             return
        case 10://360 Images
            Localstore.shared.lastSelectedTableViewCell = 4
            navigationController?.pushViewController(ImagesCategoriesViewController.control, animated: true)
            return
        default:
            return
        }
    }
    
    //MARK:- Check store for latest build
    func isUpdateAvailable() throws -> Bool {
        guard let info = Bundle.main.infoDictionary,
            let currentVersion = info["CFBundleShortVersionString"] as? String,
            let identifier = info["CFBundleIdentifier"] as? String,
            let url = URL(string: "http://itunes.apple.com/lookup?bundleId=\(identifier)") else {
                throw VersionError.invalidBundleInfo
        }
        let data = try Data(contentsOf: url)
        guard let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else {
            throw VersionError.invalidResponse
        }
        if let result = (json["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String {
            return version != currentVersion
        }
        throw VersionError.invalidResponse
    }
    
    //MARK:- Show Popup
    func popupUpdateDialogue(){
        let alertMessage = "A new version of application is available. \nWould you like to upgrade?"
        let alert = UIAlertController(title: "New Version Available", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okBtn = UIAlertAction(title: "Upgrade Now", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            if let url = URL(string: "itms-apps://itunes.apple.com/us/app/nextstone/id1439539145"),
                UIApplication.shared.canOpenURL(url){
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        let noBtn = UIAlertAction(title:"Skip" , style: .destructive, handler: {(_ action: UIAlertAction) -> Void in
        })
        alert.addAction(okBtn)
        alert.addAction(noBtn)
        self.present(alert, animated: true, completion: nil)
    }
}
