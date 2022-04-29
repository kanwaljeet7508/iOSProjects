//
//  MaterialCalculatorStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 20/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import Alamofire

class MaterialCalculatorStore: BaseApiStore {
    
    static let sharedInstance = MaterialCalculatorStore()
    
    /*_____REQUEST_RANDOM_ROCKS_____*/
    func requestRandomRocks(completion: @escaping (_ : BaseMaterialClass?) -> Void){
        requestBaseGetAPI(APIS.REQUEST_RANDOM_ROCKS) { (dict) in
            completion(BaseMaterialClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_RANDOM_ROCKS_COLOR_____*/
    func requestRandomRocksColor(completion: @escaping (_ : RockColorBaseClass?) -> Void){
        requestBaseGetAPI("\(APIS.REQUEST_RANDOM_ROCKS)/\(Localstore.shared.rockProfileId!)") { (dict) in
            completion(RockColorBaseClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_OUTSIDE_CORNER_____*/
    func requestOutsideCorner(completion: @escaping (_ : RockColorBaseClass?) -> Void){
        requestBaseGetAPI(APIS.REQUEST_OUTSIDE_CORNER) { (dict) in
            completion(RockColorBaseClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_INSIDE_CORNER_____*/
    func requestInsideCorner(completion: @escaping (_ : RockColorBaseClass?) -> Void){
        requestBaseGetAPI(APIS.REQUEST_INSIDE_CORNER) { (dict) in
            completion(RockColorBaseClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_TRANSITION_____*/
    func requestTransition(completion: @escaping (_ : RockColorBaseClass?) -> Void){
        requestBaseGetAPI(APIS.REQUEST_TRANSITION) { (dict) in
            completion(RockColorBaseClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_TERMINATION_____*/
    func requestTermination(completion: @escaping (_ : RockColorBaseClass?) -> Void){
        requestBaseGetAPI(APIS.REQUEST_TERMINATION) { (dict) in
            completion(RockColorBaseClass.init(object: dict!))
        }
    }
    
    /*_____REQUEST_TERMINATION_____*/
    func requestSubmitQuestion(_ fileName:String, completion: @escaping (_ :String, _ message : String) -> Void) {
        SVProgressHUD.show()
        var dict = UserStore.sharedInsatnce.baseModel.parameters
        dict.updateValue(Localstore.shared.wrapDoor as String, forKey: "doorFeetRecieved")
        dict.updateValue(Localstore.shared.wrapWindows as String, forKey: "windowFeetRecieved")
        dict.updateValue(UserStore.sharedInsatnce.userId!, forKey: "userId")
        dict.updateValue(fileName, forKey: "fileName")
        dict.updateValue(Localstore.shared.outsideCorners as String, forKey: "outSideSqFt")
        dict.updateValue(Localstore.shared.insideCorners as String, forKey: "inSideSqFt")
        dict.updateValue(Localstore.shared.outsideCornersArray as Array<Any>, forKey: "dimensionOfOutsideCorners")
        dict.updateValue(Localstore.shared.insideCornersArray as Array<Any>, forKey: "dimensionOfInsideCorners")
        dict.updateValue(Localstore.shared.wrapWindowsArray as Array<Any>, forKey: "dimentionOfWindows")
        dict.updateValue(Localstore.shared.wrapDoorArray as Array<Any>, forKey: "dimentionOfDoors")
        
        print("dict :",dict)
        Alamofire.request(APIS.REQUEST_SUBMIT_QUESTIONS, method: .post, parameters: dict, encoding: JSONEncoding.default)
            .responseJSON { response in
                PdfStore.sharedInstance.requestlastPdfList(UserStore.sharedInsatnce.userId!, { (flag,value) in
                    if flag {
                        completion(value, "")
                    } else {
                        
                    }
                })
        }
    }
}
