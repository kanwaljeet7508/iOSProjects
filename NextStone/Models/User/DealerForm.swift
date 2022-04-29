//
//  DelaerForm.swift
//  NextStone
//
//  Created by Mobile on 12/06/19.
//  Copyright © 2019 Hakikat Singh. All rights reserved.
//

import UIKit

let REQUEST_DEALER_US_P1_NAME = "name"
let REQUEST_DEALER_US_P2_PHONE = "phone"
let REQUEST_DEALER_US_P3_COMPANY = "company"
let REQUEST_DEALER_US_P4_ADDRESS = "address"
let REQUEST_DEALER_US_P4_MESSAGE = "subject"

class DealerForm: NSObject {
    
    var name: String!
    var phone: String!
    var company: String!
    var address: String!
    var subject: String!
    
    var parameters: [String: String] {
        var dictionary: [String: String] = [:]
        if let value = name { dictionary[REQUEST_DEALER_US_P1_NAME] = value }
        if let value = phone { dictionary[REQUEST_DEALER_US_P2_PHONE] = value }
        if let value = company { dictionary[REQUEST_DEALER_US_P3_COMPANY] = value }
        if let value = address { dictionary[REQUEST_DEALER_US_P4_ADDRESS] = value }
        if let value = subject { dictionary[REQUEST_DEALER_US_P4_MESSAGE] = value }
        return dictionary
    }
    
}

