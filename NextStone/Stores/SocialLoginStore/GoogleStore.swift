//
//  GoogleStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleStore: NSObject, GIDSignInDelegate {
  
    class var shared: GoogleStore {
        struct Static {
            static let instance: GoogleStore = GoogleStore()
        }
        return Static.instance
    }
    
    func initGoogle() {
        initGSignIn()
    }
    
    private func initGSignIn() {
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "1098392246493-0l78c6gvr848i31lavl1f6eeqc6nqsho.apps.googleusercontent.com"
        let _: NSError?
        // GGLContext.sharedInstance().configureWithError(&configureError)
       // assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private var completionHandler: (Login?)->Void = {_ in }
    
    func requestUserDetail(_ completion: @escaping (_ : Login?) -> Void) {
        completionHandler = completion
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            let login = Login()
            login.email = user.profile.email ?? ""
            login.loginType = .google
            login.socialId = user.userID ?? ""
            completionHandler(login)
        } else {
            completionHandler(nil)
            print("\(error.localizedDescription)")
        }
    }
    
    @nonobjc func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                         withError error: Error!) {
    }
}
