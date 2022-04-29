//
//  Data.swift
//
//  Created by User on 26/06/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Gallery {

    let BASE_IMAGE_URL = "http://api.nextstone.com/uploads/gallery_images/"
    
  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDataInternalIdentifierKey: String = "id"
  public let kDataNameKey: String = "name"
  private let kDataImageKey: String = "image"

  // MARK: Properties
  public var internalIdentifier: String?
  public var name: String?
  private var image: String?

    public var imageURL: URL {
        return URL(string:"\(BASE_IMAGE_URL)\(image!)")!
    }
    
    
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
    internalIdentifier = json[kDataInternalIdentifierKey].string
    name = json[kDataNameKey].string
    image = json[kDataImageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kDataInternalIdentifierKey] = value }
    if let value = name { dictionary[kDataNameKey] = value }
    if let value = image { dictionary[kDataImageKey] = value }
    return dictionary
  }

}


