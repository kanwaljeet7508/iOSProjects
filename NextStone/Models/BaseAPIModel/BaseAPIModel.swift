//
//  BaseAPIModel.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import SwiftyJSON

// MARK: Common Keys
let kBaseMessageKey: String = "message"
let kBaseStatusKey: String = "status"
let kBaseDataKey: String = "data"

public class BaseAPIModel {
    
    // MARK: Properties
    public var status: Int?
    public var data: JSON?
    public var message: String?
    
    // MARK: SwiftyJSON Initalizers
    /**
     Initates the instance based on the object
     - parameter object: The object of either Dictionary or Array kind that was passed.
     - returns: An initalized instance of the class.
     */
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /**
     Initates the instance based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    public init(json: JSON) {
        status = json[kBaseStatusKey].int
        data = json[kBaseDataKey]
        message = json[kBaseMessageKey].string
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = status { dictionary[kBaseStatusKey] = value }
        if let value = message { dictionary[kBaseMessageKey] = value }
        if let value = data { dictionary[kBaseDataKey] = value }
        return dictionary
    }
    
}
