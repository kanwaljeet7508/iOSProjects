//
//  DeletePdf.swift
//
//  Created by User on 29/06/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DeletePdf: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDeletePdfStatusKey: String = "status"
  private let kDeletePdfDataKey: String = "data"
  private let kDeletePdfMessageKey: String = "message"

  // MARK: Properties
  public var status: Int?
  public var data: [Any]?
  public var message: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    status = json[kDeletePdfStatusKey].int
    if let items = json[kDeletePdfDataKey].array { data = items.map { $0.object} }
    message = json[kDeletePdfMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kDeletePdfStatusKey] = value }
    if let value = data { dictionary[kDeletePdfDataKey] = value }
    if let value = message { dictionary[kDeletePdfMessageKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: kDeletePdfStatusKey) as? Int
    self.data = aDecoder.decodeObject(forKey: kDeletePdfDataKey) as? [Any]
    self.message = aDecoder.decodeObject(forKey: kDeletePdfMessageKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: kDeletePdfStatusKey)
    aCoder.encode(data, forKey: kDeletePdfDataKey)
    aCoder.encode(message, forKey: kDeletePdfMessageKey)
  }

}
