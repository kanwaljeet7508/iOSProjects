//
//  Data.swift
//
//  Created by Mobile on 26/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ThreeSixtyCategoriesImagesData {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDataInternalIdentifierKey: String = "id"
  private let kDataCatIdKey: String = "catId"
  private let kDataImageKey: String = "image"

  // MARK: Properties
  public var internalIdentifier: String?
  public var catId: String?
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
    internalIdentifier = json[kDataInternalIdentifierKey].string
    catId = json[kDataCatIdKey].string
    image = json[kDataImageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kDataInternalIdentifierKey] = value }
    if let value = catId { dictionary[kDataCatIdKey] = value }
    if let value = image { dictionary[kDataImageKey] = value }
    return dictionary
  }

}
