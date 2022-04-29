//
//  AbstractControl.swift
//  NextStone
//
//  Created by Mobile on 27/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import CoreLocation

var user_Current_latitude = ""
var user_Current_longitude = ""
var user_Address = ""
var user_country = ""
var user_State = ""
var user_City = ""

class AbstractControl: UIViewController, UITextFieldDelegate {
    
    //MARK: variables
    var screenCheck: Bool = true
    var value1 = 0
    var value2 = 0
    var finalInches = 0
    var feet = 0.0
    var totalFeet = 0.0

    var locManager = CLLocationManager()
    var currentLocation: CLLocation!

    //MARK: Class Function
    class var control: AbstractControl {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: self)) as! AbstractControl
    }
    
    func className() -> String {
        return NSStringFromClass(self.classForCoder)
    }
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if screenCheck {
            view.insertSubview(backGroundImage, at: 0)
        }
    }
    
    //Fetch User Location
    func fetchUserLocation() {
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
    }
    
    func getAdressName(coords: CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(coords) { (placemark, error) in
            if error != nil {
                print("ERROR")
            } else {
                let place = placemark! as [CLPlacemark]
                if place.count > 0 {
                    let place = placemark![0]
                    var adressString : String = ""
                    if place.thoroughfare != nil {
                        adressString = adressString + place.thoroughfare! + ", "
                    }
                    if place.subThoroughfare != nil {
                        adressString = adressString + place.subThoroughfare! + "\n"
                    }
                    if place.locality != nil {
                        adressString = adressString + place.locality! + " - "
                        user_City = place.locality!
                    }
                    if place.postalCode != nil {
                        adressString = adressString + place.postalCode! + "\n"
                    }
                    if place.administrativeArea != nil {
                        adressString = adressString + place.administrativeArea! + "\n"
                        user_State = place.administrativeArea!
                    }
                    if place.subAdministrativeArea != nil {
                        adressString = adressString + place.subAdministrativeArea! + " - "
                    }
                    if place.country != nil {
                        adressString = adressString + place.country!
                        user_country = place.country!
                    }
                    print("Address String: ",adressString)
                    user_Address = adressString
                }
            }
        }
    }
    
    //MARK:- viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backGroundImage.addConstraintToFillSuperview()
    }
    
    //MARK:- FUNCTIONS
    func changeColor( _ button: UIButton, _ secondButton : UIButton) {
        button.backgroundColor = Constants.THEME_COLOR
        button.setTitleColor(UIColor.white, for: .normal)
        secondButton.backgroundColor = UIColor.clear
        secondButton.setTitleColor(Constants.THEME_COLOR, for: .normal)
    }
    
    //MARK:- GETTER SETTER FOR BACKGROUND
    var _backGroundImage: UIImageView?
    var backGroundImage: UIImageView {
        get {
            if _backGroundImage == nil {
                _backGroundImage = UIImageView.init(image: #imageLiteral(resourceName: "bg"))
            }
            return _backGroundImage!
        }
        set {
            _backGroundImage = newValue
        }
    }
    
    // MARK : TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

//status bar
extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


extension AbstractControl : CLLocationManagerDelegate {
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locManager.location else {
            return
        }
        
        user_Current_latitude = "\(currentLocation.coordinate.latitude)"
        user_Current_longitude = "\(currentLocation.coordinate.longitude)"
        getAdressName(coords: currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
