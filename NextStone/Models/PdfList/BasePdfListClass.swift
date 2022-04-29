//
//  BasePdfListClass.swift
//
//  Created by Hakikat Singh on 25/05/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BasePdfListClass {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kBasePdfListClassPdfDataKey: String = "data"
  private let kBasePdfListClassStatusKey: String = "status"
  private let kBasePdfListClassMessageKey: String = "message"

  // MARK: Properties
  public var pdfData: [PdfData]?
  public var status: Int?
  public var message: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    if let items = json[kBasePdfListClassPdfDataKey].array { pdfData = items.map { PdfData(json: $0) } }
    status = json[kBasePdfListClassStatusKey].int
    message = json[kBasePdfListClassMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = pdfData { dictionary[kBasePdfListClassPdfDataKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[kBasePdfListClassStatusKey] = value }
    if let value = message { dictionary[kBasePdfListClassMessageKey] = value }
    return dictionary
  }

}


