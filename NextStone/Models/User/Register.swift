//
//  Register.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

let REGISTER_P1_EMAIL = "email"
let REGISTER_P2_PASSWORD = "password"
let REGISTER_P3_LATITUDE = "latitude"
let REGISTER_P4_LONGITUDE = "longitude"
let REGISTER_P5_ADDRESS = "address"
let REGISTER_P6_COUNTERY = "country"
let REGISTER_P7_STATE = "state"
let REGISTER_P8_CITY = "city"

class Register: NSObject {
   
    var email: String!
    var password: String!
    var latitude: String!
    var longitude: String!
    var address: String!
    var country:String!
    var state:String!
    var city:String!
    
    var parameters: [String: String] {
        var dictionary: [String: String] = [:]
        if let value = email { dictionary[REGISTER_P1_EMAIL] = value }
        if let value = password { dictionary[REGISTER_P2_PASSWORD] = value }
        if let value = latitude { dictionary[REGISTER_P3_LATITUDE] = value }
        if let value = longitude { dictionary[REGISTER_P4_LONGITUDE] = value }
        if let value = address { dictionary[REGISTER_P5_ADDRESS] = value }
        if let value = country { dictionary[REGISTER_P6_COUNTERY] = value }
        if let value = state { dictionary[REGISTER_P7_STATE] = value }
        if let value = city { dictionary[REGISTER_P8_CITY] = value }
        return dictionary
    }
    
}
