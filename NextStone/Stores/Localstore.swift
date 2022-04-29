//
//  Localstore.swift
//  NextStone
//
//  Created by Mobile on 28/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class Localstore: NSObject {

  static let shared = Localstore()
    
    /*_____DEVICE_TOKEN_____*/
    var deviceToken: String {
        get {
            let deviceToken = UserDefaults.standard.value(forKey: "deviceTokenKey")
            if deviceToken == nil {
                return "Simulator"
            } else {
                let string = deviceToken as! String?
                return (string?.isEmpty)! ? "Simulator" : string!
            }
        } set {
            UserDefaults.standard.set(newValue, forKey: "deviceTokenKey")
        }
    }
    
    
    /*_____ROCK_PROFILE_ID_____*/
    var rockProfileId: String! {
        get {
            let rockProfileId = UserDefaults.standard.value(forKey: "rockProfileId")
            if rockProfileId == nil {
                return "0"
            } else {
                return rockProfileId as! String?
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "rockProfileId")
            } else {
                UserDefaults.standard.set(newValue, forKey: "rockProfileId")
            }
        }
    }
    
    
    /*_____Wrap_Door_____*/
    var wrapDoor: String! {
        get {
            let wrapDoor = UserDefaults.standard.value(forKey: "wrapDoor")
            if wrapDoor == nil {
                return "0"
            } else {
                return wrapDoor as! String
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "wrapDoor")
            } else {
                UserDefaults.standard.set(newValue, forKey: "wrapDoor")
            }
        }
    }
    
    /*_____Wrap_DoorArray_____*/
    var wrapDoorArray: [[String: [String: Int]]]! {
        get {
            let wrapDoorArray = UserDefaults.standard.value(forKey: "wrapDoorArray")
            if wrapDoorArray == nil {
                return []
            } else {
                return wrapDoorArray as! [[String: [String: Int]]]
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "wrapDoorArray")
            } else {
                UserDefaults.standard.set(newValue, forKey: "wrapDoorArray")
            }
        }
    }

    
    /*_____OutsideCorners_____*/
    var outsideCorners: String! {
        get {
            let outsideCorners = UserDefaults.standard.value(forKey: "outsideCorners")
            if outsideCorners == nil {
                return "0"
            } else {
                return outsideCorners as! String
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "outsideCorners")
            } else {
                UserDefaults.standard.set(newValue, forKey: "outsideCorners")
            }
        }
    }
    
    /*_____OutsideCornersArray_____*/
    var outsideCornersArray: [[String: Int]]! {
        get {
            let outsideCornersArray = UserDefaults.standard.value(forKey: "outsideCornersArray")
            if outsideCornersArray == nil {
                return []
            } else {
                return outsideCornersArray as! [[String : Int]]
            }
        }  set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "outsideCornersArray")
            } else {
                UserDefaults.standard.set(newValue, forKey: "outsideCornersArray")
            }
        }
    }
    
    
    /*_____InsideCorners_____*/
    var insideCorners: String! {
        get {
            let insideCorners = UserDefaults.standard.value(forKey: "insideCorners")
            if insideCorners == nil {
                return "0"
            } else {
                return insideCorners as! String
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "insideCorners")
            } else {
                UserDefaults.standard.set(newValue, forKey: "insideCorners")
            }
        }
    }
    
    /*_____InsideCornersArray_____*/
    var insideCornersArray: [[String: Int]]! {
        get {
            let insideCornersArray = UserDefaults.standard.value(forKey: "insideCornersArray")
            if insideCornersArray == nil {
                return []
            } else {
                return insideCornersArray as! [[String : Int]]
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "insideCornersArray")
            } else {
                UserDefaults.standard.set(newValue, forKey: "insideCornersArray")
            }
        }
    }
    
    /*_____Wrap_Windows_____*/
    var wrapWindows: String! {
        get {
            let wrapWindows = UserDefaults.standard.value(forKey: "wrapWindows")
            if wrapWindows == nil {
                return "0"
            } else {
                return wrapWindows as! String
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "wrapWindows")
            } else {
                UserDefaults.standard.set(newValue, forKey: "wrapWindows")
            }
        }
    }
    
    /*_____Wrap_Windows_Array____*/
    var wrapWindowsArray: [[String: [String: Int]]]! {
        get {
            let wrapWindowsArray = UserDefaults.standard.value(forKey: "wrapWindowsArray")
            if wrapWindowsArray == nil {
                return []
            } else {
                return wrapWindowsArray as! [[String: [String: Int]]]
            }
        } set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "wrapWindowsArray")
            } else {
                UserDefaults.standard.set(newValue, forKey: "wrapWindowsArray")
            }
        }
    }
    
    //MARK:- First Time User
    var lastSelectedTableViewCell: Int! {
        get {
            return UserDefaults.standard.value(forKey: "lastSelectedTableViewCell") as? Int ?? nil
        } set {
            UserDefaults.standard.set(newValue, forKey: "lastSelectedTableViewCell")
        }
    }

    var commercailStores: [WhereBuy] {
        let commercial = [WhereBuy(#imageLiteral(resourceName: "ABC"), "ABC Supply Co. inc.", "https://www.abcsupply.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Apine"), "Alpine Lumber", "http://alpinelumber.com/alpine-lumber-yard-locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Carter"), "Carter Lumber", "https://www.carterlumber.com/store-locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Century"), "Century Lumber Center", "http://www.centurylumbercenter.com/locations.aspx"),
                          WhereBuy(#imageLiteral(resourceName: "Crescent"), "Crescent Lumber", "https://www.crescentlumberco.com/"),
                          WhereBuy(#imageLiteral(resourceName: "Cross"), "CrossRoads Building Supply Inc.", "http://www.crossroadsbuildingsupply.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Hammond"), "Hammond Lumber Company", "https://www.hammondlumber.com/locations"),
                          WhereBuy(#imageLiteral(resourceName: "Jaeger"), "Jaeger Lumber", "https://www.jaegerlumber.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Lansing"), "Lansing Building Products", "https://lansingbp.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Lezzer"), "Lezzer Lumber", "https://lezzerlumber.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Lumber"), "84 Lumber", "https://www.84lumber.com/store-locator/"),
                          WhereBuy(#imageLiteral(resourceName: "Marsh"), "Marsh Building Products", "https://marshbuild.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "NewCastle"), "New Castle Building Products", "https://ncbp.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Richards"), "Richards Building Supply", "http://www.richards-supply.com/locations/"),
                          WhereBuy(#imageLiteral(resourceName: "Stone"), "Stone Distribution", "https://stonedistributionllc.com/"),
                          WhereBuy(#imageLiteral(resourceName: "Universal"), "Universal Supply Co. Inc.", "http://www.universalsupply.com/contact/locations.html"),
                          WhereBuy(#imageLiteral(resourceName: "Usbs"), "USBS US Building Supply", "https://www.usbsinc.com/locations"),
                          WhereBuy(#imageLiteral(resourceName: "Wholesale"), "Wholesale Patio Supply", "http://www.wpatio.com/")]
        return commercial
    }
    
    var retailStores: [WhereBuy] {
        let retail = [WhereBuy(#imageLiteral(resourceName: "Ace"), "Ace Hardware – AceNet Direct In Store Catalog", "http://www.acehardware.com/mystore/storeLocator.jsp"),
                          WhereBuy(#imageLiteral(resourceName: "Amazon"), "Amazon", "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=NextStone"),
                          WhereBuy(#imageLiteral(resourceName: "Bonanza"), "Bonanza", "https://www.bonanza.com/items/search?q[catalog_id]=&q[country_to_filter]=US&q[filter_category_id]=&q[in_booth_id]=&q[ship_country]=1&q[shipping_in_price]=0&q[sort_by]=relevancy&q[suggestion_found]=&q[translate_term]=true&q[search_term]=NextStone"),
                          WhereBuy(#imageLiteral(resourceName: "Ebay"), "Ebay", "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313.TR8.TRC1.A0.H0.XNextStone.TRS0&_nkw=NextStone&_sacat=0"),
                          WhereBuy(#imageLiteral(resourceName: "Home_Depot"), "Home Depot", "https://www.homedepot.com/l/search/4007/full/"),
                          WhereBuy(#imageLiteral(resourceName: "Lowes_Proservices"), "Lowes – Pro Services", "https://www.lowes.com/store/"),
                          WhereBuy(#imageLiteral(resourceName: "Walmart"), "Walmart", "https://www.walmart.com/search/?query=NextStone&cat_id=0")]
        return retail
    }
    
    var canadaStores: [WhereBuy] {
        let canada = [WhereBuy(#imageLiteral(resourceName: "AFA_Logo"), "AFA Forest Products Inc.", "http://afaforest.com/")]
        return canada
    }
    
    var panelVideo: [VideoPlay] {
        let panel = [VideoPlay("NextStone Installation Demo",           "zsQhHn1g31Q"),
                      VideoPlay("Installing NextStone Starter Strip", "wcZfJrgUBxM"),
                      VideoPlay("Installing NextStone Window  Door Trim", "3TozAUcBbaE"),
                      VideoPlay("Mitering NextStone Panels", "bWILwXEGGMU"),
                      VideoPlay("Installing NextStone Panels  over Concrete", "lL2F4ABzekY"),
                      VideoPlay("Touch Up Two Cut NextStone  Panels Joined Together", "g7zpkl3q47Q"),
                      VideoPlay("Using NextStone Grout and  Touch Up Paint", "Twy50kQFt5E"),
                      VideoPlay("Tip on a Tight NextStone  Panel Install", "R2TJhcTJt_k")]
        return panel
    }
    
    var coverVideo: [VideoPlay] {
        let cover = [VideoPlay("NextStone Slatestone 1pc Post  Cover Install", "Wtya6pl0XTc"),
                     VideoPlay("NextStone Slatestone 2pc Post  Cover Install", "PPsM0ypkh-Y"),
                     VideoPlay("NextStone Post Cover Wiring – How to Splice", "2NxaOOZLj3I"),
                     VideoPlay("Installing Rail Mounting  Blocks on NextStone Post Covers", "K8lTgVaT3as"),
                     VideoPlay("Making a Post Cover Cap for  Existing Posts to Go Through", "uK3sqsj6o2U"),
                     VideoPlay("Post Cover Cap Light Install  Demo", "v1k2td4_K5A")]
        return cover
    }
}
