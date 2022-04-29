//
//  ThreeSixtyCategoriesImages.swift
//
//  Created by Mobile on 26/03/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ThreeSixtyCategoriesImages {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kThreeSixtyCategoriesImagesStatusKey: String = "status"
  private let kThreeSixtyCategoriesImagesDataKey: String = "data"
  private let kThreeSixtyCategoriesImagesMessageKey: String = "message"

  // MARK: Properties
  public var status: Int?
  public var data: [ThreeSixtyCategoriesImagesData]?
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
    status = json[kThreeSixtyCategoriesImagesStatusKey].int
    if let items = json[kThreeSixtyCategoriesImagesDataKey].array { data = items.map { ThreeSixtyCategoriesImagesData(json: $0) } }
    message = json[kThreeSixtyCategoriesImagesMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kThreeSixtyCategoriesImagesStatusKey] = value }
    if let value = data { dictionary[kThreeSixtyCategoriesImagesDataKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[kThreeSixtyCategoriesImagesMessageKey] = value }
    return dictionary
  }

}
