//
//  PdfData.swift
//
//  Created by Hakikat Singh on 25/05/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct PdfData {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kPdfDataRandomRockPanelKey: String = "randomRockPanel"
  private let kPdfDataDimentionOfWindowsKey: String = "dimentionOfWindows"
  private let kPdfDataLightFixtureStatusKey: String = "lightFixtureStatus"
  private let kPdfDataTrimKey: String = "trim"
  private let kPdfDataWindowWrapStatusKey: String = "windowWrapStatus"
  private let kPdfDataUserIdKey: String = "userId"
  private let kPdfDataDimentionHeightKey: String = "dimentionHeight"
  private let kPdfDataDimentionWidthKey: String = "dimentionWidth"
  private let kPdfDataNoOfElectricalOutletsKey: String = "noOfElectricalOutlets"
  private let kPdfDataOutsideCornerKey: String = "outsideCorner"
  private let kPdfDataNoOfLightFixturesKey: String = "noOfLightFixtures"
  private let kPdfDataPanelProfileKey: String = "panelProfile"
  private let kPdfDataInternalIdentifierKey: String = "id"
  private let kPdfDataDoorsWrapStatusKey: String = "doorsWrapStatus"
  private let kPdfDataElectricalOutletStatusKey: String = "electricalOutletStatus"
  private let kPdfDataDimentionOfDoorsKey: String = "dimentionOfDoors"
  private let kPdfDataTerminationKey: String = "termination"
  private let kPdfDataInsideCornerKey: String = "insideCorner"
  private let kPdfDataLedgerKey: String = "ledger"
  private let kPdfDataAddedOnKey: String = "addedOn"
  private let kPdfDataTransitionKey: String = "transition"
    private let kPdfDataFileNameKey: String = "fileName"
    
  // MARK: Properties
  public var randomRockPanel: String?
  public var dimentionOfWindows: String?
  public var lightFixtureStatus: String?
  public var trim: String?
  public var windowWrapStatus: String?
  public var userId: String?
  public var dimentionHeight: String?
  public var dimentionWidth: String?
  public var noOfElectricalOutlets: String?
  public var outsideCorner: String?
  public var noOfLightFixtures: String?
  public var panelProfile: String?
  public var internalIdentifier: String?
  public var doorsWrapStatus: String?
  public var electricalOutletStatus: String?
  public var dimentionOfDoors: String?
  public var termination: String?
  public var insideCorner: String?
  public var ledger: String?
  public var addedOn: String?
  public var transition: String?
 public var fileName: String?
    
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
    randomRockPanel = json[kPdfDataRandomRockPanelKey].string
    dimentionOfWindows = json[kPdfDataDimentionOfWindowsKey].string
    lightFixtureStatus = json[kPdfDataLightFixtureStatusKey].string
    trim = json[kPdfDataTrimKey].string
    windowWrapStatus = json[kPdfDataWindowWrapStatusKey].string
    userId = json[kPdfDataUserIdKey].string
    dimentionHeight = json[kPdfDataDimentionHeightKey].string
    dimentionWidth = json[kPdfDataDimentionWidthKey].string
    noOfElectricalOutlets = json[kPdfDataNoOfElectricalOutletsKey].string
    outsideCorner = json[kPdfDataOutsideCornerKey].string
    noOfLightFixtures = json[kPdfDataNoOfLightFixturesKey].string
    panelProfile = json[kPdfDataPanelProfileKey].string
    internalIdentifier = json[kPdfDataInternalIdentifierKey].string
    doorsWrapStatus = json[kPdfDataDoorsWrapStatusKey].string
    electricalOutletStatus = json[kPdfDataElectricalOutletStatusKey].string
    dimentionOfDoors = json[kPdfDataDimentionOfDoorsKey].string
    termination = json[kPdfDataTerminationKey].string
    insideCorner = json[kPdfDataInsideCornerKey].string
    ledger = json[kPdfDataLedgerKey].string
    addedOn = json[kPdfDataAddedOnKey].string
    transition = json[kPdfDataTransitionKey].string
    fileName = json[kPdfDataFileNameKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = randomRockPanel { dictionary[kPdfDataRandomRockPanelKey] = value }
    if let value = dimentionOfWindows { dictionary[kPdfDataDimentionOfWindowsKey] = value }
    if let value = lightFixtureStatus { dictionary[kPdfDataLightFixtureStatusKey] = value }
    if let value = trim { dictionary[kPdfDataTrimKey] = value }
    if let value = windowWrapStatus { dictionary[kPdfDataWindowWrapStatusKey] = value }
    if let value = userId { dictionary[kPdfDataUserIdKey] = value }
    if let value = dimentionHeight { dictionary[kPdfDataDimentionHeightKey] = value }
    if let value = dimentionWidth { dictionary[kPdfDataDimentionWidthKey] = value }
    if let value = noOfElectricalOutlets { dictionary[kPdfDataNoOfElectricalOutletsKey] = value }
    if let value = outsideCorner { dictionary[kPdfDataOutsideCornerKey] = value }
    if let value = noOfLightFixtures { dictionary[kPdfDataNoOfLightFixturesKey] = value }
    if let value = panelProfile { dictionary[kPdfDataPanelProfileKey] = value }
    if let value = internalIdentifier { dictionary[kPdfDataInternalIdentifierKey] = value }
    if let value = doorsWrapStatus { dictionary[kPdfDataDoorsWrapStatusKey] = value }
    if let value = electricalOutletStatus { dictionary[kPdfDataElectricalOutletStatusKey] = value }
    if let value = dimentionOfDoors { dictionary[kPdfDataDimentionOfDoorsKey] = value }
    if let value = termination { dictionary[kPdfDataTerminationKey] = value }
    if let value = insideCorner { dictionary[kPdfDataInsideCornerKey] = value }
    if let value = ledger { dictionary[kPdfDataLedgerKey] = value }
    if let value = addedOn { dictionary[kPdfDataAddedOnKey] = value }
    if let value = transition { dictionary[kPdfDataTransitionKey] = value }
    if let value = fileName { dictionary[kPdfDataFileNameKey] = value }
    return dictionary
  }

}
