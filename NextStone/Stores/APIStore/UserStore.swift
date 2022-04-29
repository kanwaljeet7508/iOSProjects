//
//  UserStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 18/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class UserStore: BaseApiStore {
    
    static let sharedInsatnce = UserStore()
    
    var baseModel: BaseSubmitQuestionClass!
    
    //MARK:- GETTER SETTER METHODS
    /*_____Store user id_____*/
    var userId: String! {
        get {
            let userId = UserDefaults.standard.value(forKey: "userId")
            if userId == nil {
                return ""
            } else {
                return userId as! String?
            }
        }
        set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "userId")
            } else {
                UserDefaults.standard.set(newValue, forKey: "userId")
            }
        }
    }
        
    //MARK:- APIS
    /*_____REQUEST_REGISTER_____*/
    func requestRegisterUser(_ register: Register, completion: @escaping (_ :Int, _ : String, _ message : String) -> Void) {
        print(register.parameters)
        requestBaseAPI(APIS.REQUEST_REGISTER, parameters: register.parameters, completion: { (baseModel) in
            if baseModel.status == 1 {
                    completion (baseModel.status!, (baseModel.data?["id"].string!)!, baseModel.message!)
            } else {
                completion (baseModel.status!, "", baseModel.message!)
            }
        })
    }
    
    /*_____REQUEST_LOGIN_____*/
    func requestLogin(_ login: Login, completion: @escaping (_ :Int, _ : String, _ message : String) -> Void) {
        requestBaseAPI(APIS.REQUEST_LOGIN, parameters: login.parameters, completion: { (baseModel) in
            if baseModel.status == 1 {
                completion (baseModel.status!, (baseModel.data?["id"].string!)!, baseModel.message!)
            } else {
                completion (baseModel.status!, "", baseModel.message!)
            }
        })
    }
    
    
    /*_____CONTACT_US_____*/
    func requestContact(_ contact: Contact, completion: @escaping (_ :Int, _ message : String) -> Void){
        requestBaseAPI(APIS.REQUEST_CONTACT_US, parameters: contact.parameters, completion: { (baseModel) in
            if baseModel.status == 1 {
                completion (baseModel.status!, baseModel.message!)
            } else {
                completion (baseModel.status!, baseModel.message!)
            }
        })
    }
    
    
    /*_____REQUEST_DEALER_____*/
    func requestDealer(_ dealer: DealerForm, completion: @escaping (_ :Int, _ message : String) -> Void){
        requestBaseAPI(APIS.REQUEST_DEALER, parameters: dealer.parameters, completion: { (baseModel) in
            if baseModel.status == 1 {
                completion (baseModel.status!, baseModel.message!)
            } else {
                completion (baseModel.status!, baseModel.message!)
            }
        })
    }
    
    
    /*_____FORGOT_PASSWORD_____*/
    func requestForgotPassword(_ email: String, completion: @escaping (_ :Int, _ message : String) -> Void){
        let parameters = ["email" : email]
        requestBaseAPI(APIS.REQUEST_FORGOT_PASSWORD, parameters: parameters, completion: { (baseModel) in
            if baseModel.status == 1 {
                completion (baseModel.status!, baseModel.message!)
            } else {
                completion (baseModel.status!, baseModel.message!)
            }
        })
    }
    
    /*____360 Images_____*/
    func requestThreeSixtyCategories(completion: @escaping(_ :ThreeSixtyCategories?, _ : Int) -> Void) {
        requestBaseGetAPI(APIS.IMAGES_CATEGORIES) { (dict) in
            if dict?["status"] as! Int == 1{
                completion(ThreeSixtyCategories.init(object: dict!), dict?["status"] as! Int)
            }else{
                completion(nil,0)
            }
        }
    }
    
//    func requestThreeSixtyImages(_ id: String, completion: @escaping(_ :ThreeSixtyCategoriesImages?, _ : Int) -> Void) {
//        let url = "\(APIS.IMAGES_CATEGORIES_BY_ID)\(id)"
//        requestBaseGetAPI(url) { (dict) in
//            if dict?["status"] as! Int == 1{
//                completion(ThreeSixtyCategoriesImages.init(object: dict!), dict?["status"] as! Int)
//            }else{
//                completion(nil,0)
//            }
//        }
//    }
}
