//
//  BaseApiStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import Alamofire

class BaseApiStore: NSObject {
    
    static let shared = BaseApiStore()
    
    var showProgress: Bool = true
    var retry: Int = 0
    var showError = true
    
    class var isReachable: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    //MARK:- BASE REQUEST API
    func requestBaseAPI(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : BaseAPIModel) -> Void) {
        if BaseApiStore.isReachable{
            requestAPI(url, parameters: parameters, completion: { (dict) in
                if dict != nil {
                let basemodel = BaseAPIModel.init(object: dict!)
                    completion(basemodel)
                }
            })
        } else {
            SVProgressHUD.showError(withStatus: "Check your Internet connection")
        }
    }
    
    //MARK:- BASE GET API
    func requestBaseGetAPI(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : NSDictionary?) -> Void) {
        if BaseApiStore.isReachable {
            requestAPI(url, parameters: parameters, requestType: HTTPMethod.get) { (dict) in
                if dict != nil {
                    completion(dict)
                }
            }
        } else {
            SVProgressHUD.showError(withStatus: "Check your Internet connection")
        }
    }
    
    //MARK:- GET DICT
    func requestDict(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : BaseAPIModel, _ : NSDictionary?) -> Void) {
        requestAPI(url, parameters: parameters, completion: { (dict) in
            let baseModel = BaseAPIModel.init(object: dict!)
            completion (baseModel, dict)
        })
    }
    
    func requestAPI(_ url: URLConvertible, parameters: Parameters? = nil, requestType: HTTPMethod? = nil, completion: @escaping (_ : NSDictionary?) -> Void) {
        if showProgress && !SVProgressHUD.isVisible() {
            SVProgressHUD.show(withStatus: "Loading...")
        } else {
            showProgress = true
        }
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.request(url,method: requestType ?? .post, parameters: parameters, encoding: URLEncoding.default , headers: [:]).responseJSON { response in
            SVProgressHUD.dismiss()
            self.getValidDict(result: response.result, completion: {(dict, error, retry) in
                if retry! {
                    self.requestAPI(url, parameters: parameters, completion: completion)
                    return
                }
                let errorMessage = "Some error has been occured"
                if dict == nil {
                    SVProgressHUD.show()
                    SVProgressHUD.showError(withStatus: error != nil ? error?.localizedDescription : errorMessage)
                } else {
                    let message = dict?[kBaseMessageKey] as! String
                    if dict?[kBaseStatusKey] as! Int != 1 {
                        SVProgressHUD.show()
                        SVProgressHUD.showError(withStatus: message)
                    } else {
                        self.showError = true
                    }
                }
                completion (dict)
            })
        }
    }
    
     func getValidDict(result: Result<Any>, completion: @escaping (_ : NSDictionary?, _ : NSError?, _ : Bool?) -> Void) {
        var dict: NSDictionary!
        let errorNew = result.error as NSError?
        if let json = result.value {
            dict = json as! NSDictionary
        }
        if dict == nil && errorNew != nil && (errorNew?._code == NSURLErrorTimedOut || errorNew?.localizedDescription == "The network connection was lost.") {
            if retry >= 2 {
                UIAlertController.showAlert((errorNew?.localizedDescription)!, message: "", buttons: ["Cancel", "Retry"], completion: { (alert, index) in
                    if index == 0 {
                        completion (dict, errorNew, false)
                    } else {
                        completion (dict, errorNew, true)
                    }
                })
            } else {
                retry += 1
                DispatchQueue.dispatch_main_after(1.0, block: {
                    completion (dict, errorNew, true)
                })
            }
        } else {
            completion (dict, errorNew, false)
        }
    }
}
