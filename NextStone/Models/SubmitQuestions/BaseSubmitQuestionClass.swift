//
//  BaseSubmitQuestionClass.swift
//
//  Created by Hakikat Singh on 16/05/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BaseSubmitQuestionClass {
    

  // MARK: Declaration for string constants to be used to decode and also serialize.
    private let kBaseSubmitQuestionClassDimentionOfWindowsKey: String = "dimentionOfWindows"
    private let kBaseSubmitQuestionClassLightFixtureStatusKey: String = "lightFixtureStatus"
    private let kBaseSubmitQuestionClassOutsideConerKey: String = "outsideCorner"
    private let kBaseSubmitQuestionClassTrimKey: String = "trim"
    private let kBaseSubmitQuestionClassWindowWrapStatusKey: String = "windowWrapStatus"
    private let kBaseSubmitQuestionClassDimentionHeightKey: String = "dimentionHeight"
    private let kBaseSubmitQuestionClassDimentionWidthKey: String = "dimentionWidth"
    private let kBaseSubmitQuestionClassNoOfElectricalOutletsKey: String = "noOfElectricalOutlets"
    private let kBaseSubmitQuestionClassPanelProfileKey: String = "panelProfile"
    private let kBaseSubmitQuestionClassNoOfLightFixturesKey: String = "noOfLightFixtures"
    private let kBaseSubmitQuestionClassDoorsWrapStatusKey: String = "doorsWrapStatus"
    private let kBaseSubmitQuestionClassElectricalOutletStatusKey: String = "electricalOutletStatus"
    private let kBaseSubmitQuestionClassDimentionOfDoorsKey: String = "dimentionOfDoors"
    private let kBaseSubmitQuestionClassTerminationKey: String = "termination"
    private let kBaseSubmitQuestionClassInsideCornerKey: String = "insideCorner"
    private let kBaseSubmitQuestionClassLedgerKey: String = "ledger"
    private let kBaseSubmitQuestionClassTransitionKey: String = "transition"
    private let kBaseSubmitQuestionClassRandomRockPanelKey: String = "randomRockPanel"
    private let kBaseSubmitQuestionClassDimensionOutsideCornerKey: String = "dimensionOfOutsideCorners"
    private let kBaseSubmitQuestionClassDimensionInsideCornerKey: String = "dimensionOfInsideCorners"
    private let kBaseSubmitQuestionClassFileNameKey: String = "fileName"
    private let kBaseSubmitQuestionClassDimensionHeightInFeetKey: String = "dimentionHeightInFeet"
    private let kBaseSubmitQuestionClassInsideSqFtKey: String = "inSideSqFt"
    private let kBaseSubmitQuestionClassDoorFeetReceivedKey: String = "doorFeetRecieved"
    private let kBaseSubmitQuestionClassWindowFeetReceivedKey: String = "windowFeetRecieved"
    private let kBaseSubmitQuestionClassOutsideSqFtKey: String = "outSideSqFt"
    private let kBaseSubmitQuestionClassTotalSquareAreaKey: String = "totalSquareArea"
    
    private let kBaseSubmitQuestionClassNoOfInsideCornersKey: String = "noOfInsideCorners"
    private let kBaseSubmitQuestionClassNoOfOutsideCornersKey: String = "noOfOutsideCorners"


  // MARK: Properties
    public var dimentionOfWindows: [DimentionOfWindows]?
    public var lightFixtureStatus: Int?
    public var outsideConer: String?
    public var trim: String?
    public var windowWrapStatus: Int?
    public var dimentionHeight: String?
    public var dimentionWidth: String?
    public var noOfElectricalOutlets: String?
    public var panelProfile: String?
    public var noOfLightFixtures: String?
    public var doorsWrapStatus: Int?
    public var electricalOutletStatus: Int?
    public var dimentionOfDoors: [DimentionOfDoors]?
    public var termination: String?
    public var insideCorner: String?
    public var ledger: String?
    public var transition: String?
    public var randomRockPanel: String?
    public var dimensionOfOutsideCorners: String?
    public var dimensionOfInsideCorners: String?
    public var fileName: String?
    
    public var dimentionHeightInFeet: String?
    public var inSideSqFt: String?
    public var doorFeetRecieved: String?
    public var windowFeetRecieved: String?
    public var outSideSqFt: String?
    public var totalSquareArea: String?
    
    public var noOfInsideCorners: String?
    public var noOfOutsideCorners: String?


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
    if let items = json[kBaseSubmitQuestionClassDimentionOfWindowsKey].array { dimentionOfWindows = items.map { DimentionOfWindows(json: $0) } }
    lightFixtureStatus = json[kBaseSubmitQuestionClassLightFixtureStatusKey].int
    outsideConer = json[kBaseSubmitQuestionClassOutsideConerKey].string
    trim = json[kBaseSubmitQuestionClassTrimKey].string
    windowWrapStatus = json[kBaseSubmitQuestionClassWindowWrapStatusKey].int
    dimentionHeight = json[kBaseSubmitQuestionClassDimentionHeightKey].string
    dimentionWidth = json[kBaseSubmitQuestionClassDimentionWidthKey].string
    noOfElectricalOutlets = json[kBaseSubmitQuestionClassNoOfElectricalOutletsKey].string
    panelProfile = json[kBaseSubmitQuestionClassPanelProfileKey].string
    noOfLightFixtures = json[kBaseSubmitQuestionClassNoOfLightFixturesKey].string
    doorsWrapStatus = json[kBaseSubmitQuestionClassDoorsWrapStatusKey].int
    electricalOutletStatus = json[kBaseSubmitQuestionClassElectricalOutletStatusKey].int
    if let items = json[kBaseSubmitQuestionClassDimentionOfDoorsKey].array { dimentionOfDoors = items.map { DimentionOfDoors(json: $0) } }
    termination = json[kBaseSubmitQuestionClassTerminationKey].string
    insideCorner = json[kBaseSubmitQuestionClassInsideCornerKey].string
    ledger = json[kBaseSubmitQuestionClassLedgerKey].string
    transition = json[kBaseSubmitQuestionClassTransitionKey].string
    randomRockPanel = json[kBaseSubmitQuestionClassRandomRockPanelKey].string
    dimensionOfOutsideCorners = json[kBaseSubmitQuestionClassDimensionOutsideCornerKey].string
    dimensionOfInsideCorners = json[kBaseSubmitQuestionClassDimensionInsideCornerKey].string
    fileName = json[kBaseSubmitQuestionClassFileNameKey].string
    
    dimentionHeightInFeet = json[kBaseSubmitQuestionClassDimensionHeightInFeetKey].string
    inSideSqFt = json[kBaseSubmitQuestionClassInsideSqFtKey].string
    doorFeetRecieved = json[kBaseSubmitQuestionClassDoorFeetReceivedKey].string
    windowFeetRecieved = json[kBaseSubmitQuestionClassWindowFeetReceivedKey].string
    outSideSqFt = json[kBaseSubmitQuestionClassOutsideSqFtKey].string
    totalSquareArea = json[kBaseSubmitQuestionClassTotalSquareAreaKey].string
    
    noOfInsideCorners = json[kBaseSubmitQuestionClassNoOfInsideCornersKey].string
    noOfOutsideCorners = json[kBaseSubmitQuestionClassNoOfOutsideCornersKey].string

  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = dimentionOfWindows { dictionary[kBaseSubmitQuestionClassDimentionOfWindowsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = lightFixtureStatus { dictionary[kBaseSubmitQuestionClassLightFixtureStatusKey] = value }
    if let value = outsideConer { dictionary[kBaseSubmitQuestionClassOutsideConerKey] = value }
    if let value = trim { dictionary[kBaseSubmitQuestionClassTrimKey] = value }
    if let value = windowWrapStatus { dictionary[kBaseSubmitQuestionClassWindowWrapStatusKey] = value }
    if let value = dimentionHeight { dictionary[kBaseSubmitQuestionClassDimentionHeightKey] = value }
    if let value = dimentionWidth { dictionary[kBaseSubmitQuestionClassDimentionWidthKey] = value }
    if let value = noOfElectricalOutlets { dictionary[kBaseSubmitQuestionClassNoOfElectricalOutletsKey] = value }
    if let value = panelProfile { dictionary[kBaseSubmitQuestionClassPanelProfileKey] = value }
    if let value = noOfLightFixtures { dictionary[kBaseSubmitQuestionClassNoOfLightFixturesKey] = value }
    if let value = doorsWrapStatus { dictionary[kBaseSubmitQuestionClassDoorsWrapStatusKey] = value }
    if let value = electricalOutletStatus { dictionary[kBaseSubmitQuestionClassElectricalOutletStatusKey] = value }
    if let value = dimentionOfDoors { dictionary[kBaseSubmitQuestionClassDimentionOfDoorsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = termination { dictionary[kBaseSubmitQuestionClassTerminationKey] = value }
    if let value = insideCorner { dictionary[kBaseSubmitQuestionClassInsideCornerKey] = value }
    if let value = ledger { dictionary[kBaseSubmitQuestionClassLedgerKey] = value }
    if let value = transition { dictionary[kBaseSubmitQuestionClassTransitionKey] = value }
    if let value = randomRockPanel { dictionary[kBaseSubmitQuestionClassRandomRockPanelKey] = value }
    if let value = dimensionOfOutsideCorners { dictionary[kBaseSubmitQuestionClassDimensionOutsideCornerKey] = value }
    if let value = dimensionOfInsideCorners { dictionary[kBaseSubmitQuestionClassDimensionInsideCornerKey] = value }
    if let value = fileName { dictionary[kBaseSubmitQuestionClassFileNameKey] = value }
    if let value = dimentionHeightInFeet { dictionary[kBaseSubmitQuestionClassDimensionHeightInFeetKey] = value }
    if let value = inSideSqFt { dictionary[kBaseSubmitQuestionClassInsideSqFtKey] = value }
    if let value = doorFeetRecieved { dictionary[kBaseSubmitQuestionClassDoorFeetReceivedKey] = value }
    if let value = windowFeetRecieved { dictionary[kBaseSubmitQuestionClassWindowFeetReceivedKey] = value }
    if let value = outSideSqFt { dictionary[kBaseSubmitQuestionClassOutsideSqFtKey] = value }
    if let value = totalSquareArea { dictionary[kBaseSubmitQuestionClassTotalSquareAreaKey] = value }
    
    if let value = noOfInsideCorners { dictionary[kBaseSubmitQuestionClassNoOfInsideCornersKey] = value }
    if let value = noOfOutsideCorners { dictionary[kBaseSubmitQuestionClassNoOfOutsideCornersKey] = value }

    return dictionary
  }
    
    
    var parameters: [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = dimentionOfWindows { dictionary[kBaseSubmitQuestionClassDimentionOfWindowsKey] = value.map { $0.dictionaryRepresentation() } }
        if let value = lightFixtureStatus { dictionary[kBaseSubmitQuestionClassLightFixtureStatusKey] = value }
        if let value = outsideConer { dictionary[kBaseSubmitQuestionClassOutsideConerKey] = value }
        if let value = trim { dictionary[kBaseSubmitQuestionClassTrimKey] = value }
        if let value = windowWrapStatus { dictionary[kBaseSubmitQuestionClassWindowWrapStatusKey] = value }
        if let value = dimentionHeight { dictionary[kBaseSubmitQuestionClassDimentionHeightKey] = value }
        if let value = dimentionWidth { dictionary[kBaseSubmitQuestionClassDimentionWidthKey] = value }
        if let value = noOfElectricalOutlets { dictionary[kBaseSubmitQuestionClassNoOfElectricalOutletsKey] = value }
        if let value = panelProfile { dictionary[kBaseSubmitQuestionClassPanelProfileKey] = value }
        if let value = noOfLightFixtures { dictionary[kBaseSubmitQuestionClassNoOfLightFixturesKey] = value }
        if let value = doorsWrapStatus { dictionary[kBaseSubmitQuestionClassDoorsWrapStatusKey] = value }
        if let value = electricalOutletStatus { dictionary[kBaseSubmitQuestionClassElectricalOutletStatusKey] = value }
        if let value = dimentionOfDoors { dictionary[kBaseSubmitQuestionClassDimentionOfDoorsKey] = value.map { $0.dictionaryRepresentation() } }
        if let value = termination { dictionary[kBaseSubmitQuestionClassTerminationKey] = value }
        if let value = insideCorner { dictionary[kBaseSubmitQuestionClassInsideCornerKey] = value }
        if let value = ledger { dictionary[kBaseSubmitQuestionClassLedgerKey] = value }
        if let value = transition { dictionary[kBaseSubmitQuestionClassTransitionKey] = value }
        if let value = randomRockPanel { dictionary[kBaseSubmitQuestionClassRandomRockPanelKey] = value }
        if let value = dimensionOfOutsideCorners { dictionary[kBaseSubmitQuestionClassDimensionOutsideCornerKey] = value }
        if let value = dimensionOfInsideCorners { dictionary[kBaseSubmitQuestionClassDimensionInsideCornerKey] = value }
        if let value = fileName { dictionary[kBaseSubmitQuestionClassFileNameKey] = value }
        if let value = dimentionHeightInFeet { dictionary[kBaseSubmitQuestionClassDimensionHeightInFeetKey] = value }
        if let value = inSideSqFt { dictionary[kBaseSubmitQuestionClassInsideSqFtKey] = value }
        if let value = doorFeetRecieved { dictionary[kBaseSubmitQuestionClassDoorFeetReceivedKey] = value }
        if let value = windowFeetRecieved { dictionary[kBaseSubmitQuestionClassWindowFeetReceivedKey] = value }
        if let value = outSideSqFt { dictionary[kBaseSubmitQuestionClassOutsideSqFtKey] = value }
        if let value = totalSquareArea { dictionary[kBaseSubmitQuestionClassTotalSquareAreaKey] = value }
        
        if let value = noOfInsideCorners { dictionary[kBaseSubmitQuestionClassNoOfInsideCornersKey] = value }
        if let value = noOfOutsideCorners { dictionary[kBaseSubmitQuestionClassNoOfOutsideCornersKey] = value }

        return dictionary
    }

}
