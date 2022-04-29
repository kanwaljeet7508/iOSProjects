//
//  Login.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

let LOGIN_P1_EMAIL = "email"
let LOGIN_P2_PASS = "password"
let LOGIN_P3_TYPE = "socialType"
let LOGIN_P4_SOCIAL_ID = "socialId"
let LOGIN_P5_LATITUDE = "latitude"
let LOGIN_P6_LONGITUDE = "longitude"
let LOGIN_P7_ADDRESS = "address"
let LOGIN_P8_COUNTERY = "country"
let LOGIN_P9_STATE = "state"
let LOGIN_P10_CITY = "city"

enum LoginType:String {
    case web = "native"
    case facebook = "facebook"
    case google = "gmail"
}

class Login: NSObject {
    var email: String!
    var password: String!
    var socialId: String!
    var loginType: LoginType = .web
    var latitude: String!
    var longitude: String!
    var address: String!
    var country:String!
    var state:String!
    var city:String!
    
    var parameters: [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = email { dictionary[LOGIN_P1_EMAIL] = value }
        if let value = password { dictionary[LOGIN_P2_PASS] = value }
        dictionary[LOGIN_P3_TYPE] = loginType.rawValue
        if let value = socialId { dictionary[LOGIN_P4_SOCIAL_ID] = value }
        if let value = latitude { dictionary[LOGIN_P5_LATITUDE] = value }
        if let value = longitude { dictionary[LOGIN_P6_LONGITUDE] = value }
        if let value = address { dictionary[LOGIN_P7_ADDRESS] = value }
        if let value = country { dictionary[LOGIN_P8_COUNTERY] = value }
        if let value = state { dictionary[LOGIN_P9_STATE] = value }
        if let value = city { dictionary[LOGIN_P10_CITY] = value }
        return dictionary
    }
    
}
