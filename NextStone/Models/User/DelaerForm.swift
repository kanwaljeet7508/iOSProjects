//
//  DelaerForm.swift
//  NextStone
//
//  Created by Mobile on 12/06/19.
//  Copyright © 2019 Hakikat Singh. All rights reserved.
//

import UIKit

let REQUEST_DEALER_US_P1_EMAIL = "email"
let REQUEST_DEALER_US_P2_PHONE = "phone"
let REQUEST_DEALER_US_P3_COMPANY = "company"
let REQUEST_DEALER_US_P4_ADDRESS = "address"
let REQUEST_DEALER_US_P4_MESSAGE = "message"

class DealerForm: NSObject {
    
    var email: String!
    var phone: String!
    var company: String!
    var address: String!
    var message: String!
    
    var parameters: [String: String] {
        var dictionary: [String: String] = [:]
        if let value = email { dictionary[REQUEST_CONTACT_US_P1_EMAIL] = value }
        if let value = phone { dictionary[REQUEST_CONTACT_US_P2_PHONE] = value }
        if let value = company { dictionary[REQUEST_DEALER_US_P3_COMPANY] = value }
        if let value = address { dictionary[REQUEST_DEALER_US_P4_ADDRESS] = value }
        if let value = message { dictionary[REQUEST_CONTACT_US_P4_MESSAGE] = value }
        return dictionary
    }
    
}

