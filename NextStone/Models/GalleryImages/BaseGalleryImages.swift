//
//  BaseClassGalleryImages.swift
//
//  Created by User on 26/06/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class BaseGalleryImages {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kBaseClassGalleryImagesStatusKey: String = "status"
  private let kBaseClassGalleryImagesDataKey: String = "data"
  private let kBaseClassGalleryImagesMessageKey: String = "message"

  // MARK: Properties
  public var status: Int?
  public var data: [Gallery]?
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
    status = json[kBaseClassGalleryImagesStatusKey].int
    if let items = json[kBaseClassGalleryImagesDataKey].array { data = items.map { Gallery(json: $0) } }
    message = json[kBaseClassGalleryImagesMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kBaseClassGalleryImagesStatusKey] = value }
    if let value = data { dictionary[kBaseClassGalleryImagesDataKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[kBaseClassGalleryImagesMessageKey] = value }
    return dictionary
  }

}


