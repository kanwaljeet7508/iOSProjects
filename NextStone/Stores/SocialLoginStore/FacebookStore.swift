//
//  FacbookStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class FacebookStore: NSObject {
    
    class var shared: FacebookStore {
        struct Static {
            static let instance: FacebookStore = FacebookStore()
        }
        return Static.instance
    }
    
    func requestLoginModel(_ completion: @escaping (_ : Login?) -> Void) {
        requestUserDetail { (login) in
            completion(login == nil ? nil : login)
        }
    }
    
    func requestUserDetail(_ completion: @escaping (_ : Login?) -> Void) {
        let login:FBSDKLoginManager = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["public_profile", "email"], from: UIApplication.visibleViewController, handler: { (result, error) in
            if(error != nil) {
                completion(nil)
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            } else if(result?.isCancelled)! {
                completion(nil)
                login.logOut()
                FBSDKLoginManager().logOut()
                SVProgressHUD.showError(withStatus: "User cancelled login.")
            }else {
                self.fetchUserProfile(completion)
            }
        })
    }
    
    func fetchUserProfile(_ completion: @escaping (_ : Login?) -> Void) {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, first_name, last_name, email"])
        let connection = FBSDKGraphRequestConnection()
        connection.add(graphRequest, completionHandler: { (connection, result, error) in
            SVProgressHUD.dismiss()
            if error != nil {
                completion(nil)
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            } else {
                let response = result as! NSDictionary
                print("result == ", response)
                let login = Login()
                login.email = response["email"] as? String ?? ""
                login.socialId = response["id"] as! String
                login.loginType = .facebook
                completion(login)
            }
        })
        connection.start()
    }
    
    func logout(){
        let manager = FBSDKLoginManager()
        manager.logOut()
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
    }
}
