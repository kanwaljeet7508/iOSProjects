//
//  RockColorBaseClass.swift
//
//  Created by Hakikat Singh on 02/05/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct RockColorBaseClass {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kRockColorBaseClassStatusKey: String = "status"
  private let kRockColorBaseClassColorDataKey: String = "data"
  private let kRockColorBaseClassMessageKey: String = "message"

  // MARK: Properties
  public var status: Int?
  public var colorData: [ColorData]?
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
    status = json[kRockColorBaseClassStatusKey].int
    if let items = json[kRockColorBaseClassColorDataKey].array { colorData = items.map { ColorData(json: $0) } }
    message = json[kRockColorBaseClassMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kRockColorBaseClassStatusKey] = value }
    if let value = colorData { dictionary[kRockColorBaseClassColorDataKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[kRockColorBaseClassMessageKey] = value }
    return dictionary
  }

}
