//
//  Contact.swift
//  NextStone
//
//  Created by Hakikat Singh on 24/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

let REQUEST_CONTACT_US_P1_EMAIL = "email"
let REQUEST_CONTACT_US_P2_PHONE = "phone"
let REQUEST_CONTACT_US_P3_SUBJECT = "subject"
let REQUEST_CONTACT_US_P4_MESSAGE = "message"

class Contact: NSObject {
    
    var email: String!
    var phone: String!
    var subject: String!
    var message: String!
    
    var parameters: [String: String] {
        var dictionary: [String: String] = [:]
        if let value = email { dictionary[REQUEST_CONTACT_US_P1_EMAIL] = value }
        if let value = phone { dictionary[REQUEST_CONTACT_US_P2_PHONE] = value }
        if let value = subject { dictionary[REQUEST_CONTACT_US_P3_SUBJECT] = value }
        if let value = message { dictionary[REQUEST_CONTACT_US_P4_MESSAGE] = value }
        return dictionary
    }
    
}
