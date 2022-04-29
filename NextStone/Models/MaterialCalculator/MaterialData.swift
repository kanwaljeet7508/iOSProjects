//
//  MaterialData.swift
//
//  Created by Hakikat Singh on 20/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct MaterialData {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private let kMaterialDataDescriptionValueKey: String = "description"
    private let kMaterialDataNameKey: String = "name"
    private let kMaterialDataImagesKey: String = "images"
    private let kMaterialDataInternalIdentifierKey: String = "id"
    private let kMaterialDataFirstImageKey: String = "firstImage"
    
    // MARK: Properties
    public var descriptionValue: String?
    public var name: String?
    public var images: [String]?
    public var internalIdentifier: String?
    public var firstImage: String?
    
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
        descriptionValue = json[kMaterialDataDescriptionValueKey].string
        name = json[kMaterialDataNameKey].string
        if let items = json[kMaterialDataImagesKey].array { images = items.map { $0.stringValue } }
        internalIdentifier = json[kMaterialDataInternalIdentifierKey].string
        firstImage = json[kMaterialDataFirstImageKey].string
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = descriptionValue { dictionary[kMaterialDataDescriptionValueKey] = value }
        if let value = name { dictionary[kMaterialDataNameKey] = value }
        if let value = images { dictionary[kMaterialDataImagesKey] = value }
        if let value = internalIdentifier { dictionary[kMaterialDataInternalIdentifierKey] = value }
        if let value = firstImage { dictionary[kMaterialDataFirstImageKey] = value }
        return dictionary
    }
    
}
