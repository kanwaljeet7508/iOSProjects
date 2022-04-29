//
//  ColorData.swift
//
//  Created by Hakikat Singh on 02/05/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ColorData {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kColorDataNameKey: String = "name"
  private let kColorDataRockProfileIdKey: String = "rockProfileId"
  private let kColorDataInternalIdentifierKey: String = "id"
  private let kColorDataImageKey: String = "image"

  // MARK: Properties
  public var name: String?
  public var rockProfileId: String?
  public var internalIdentifier: String?
  public var image: String?

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
    name = json[kColorDataNameKey].string
    rockProfileId = json[kColorDataRockProfileIdKey].string
    internalIdentifier = json[kColorDataInternalIdentifierKey].string
    image = json[kColorDataImageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kColorDataNameKey] = value }
    if let value = rockProfileId { dictionary[kColorDataRockProfileIdKey] = value }
    if let value = internalIdentifier { dictionary[kColorDataInternalIdentifierKey] = value }
    if let value = image { dictionary[kColorDataImageKey] = value }
    return dictionary
  }

}
