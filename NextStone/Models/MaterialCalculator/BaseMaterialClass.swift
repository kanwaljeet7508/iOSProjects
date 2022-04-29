//
//  BaseMaterialClass.swift
//
//  Created by Hakikat Singh on 20/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BaseMaterialClass {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kBaseMaterialClassMessageKey: String = "message"
  private let kBaseMaterialClassStatusKey: String = "status"
  private let kBaseMaterialClassMaterialDataKey: String = "data"

  // MARK: Properties
  public var message: String?
  public var status: Int?
  public var materialData: [MaterialData]?

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
    message = json[kBaseMaterialClassMessageKey].string
    status = json[kBaseMaterialClassStatusKey].int
    if let items = json[kBaseMaterialClassMaterialDataKey].array { materialData = items.map { MaterialData(json: $0) } }
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = message { dictionary[kBaseMaterialClassMessageKey] = value }
    if let value = status { dictionary[kBaseMaterialClassStatusKey] = value }
    if let value = materialData { dictionary[kBaseMaterialClassMaterialDataKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
