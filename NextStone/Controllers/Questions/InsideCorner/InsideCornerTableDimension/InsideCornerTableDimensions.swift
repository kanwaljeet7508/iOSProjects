//
//  InsideCornerTableDimensions.swift
//  NextStone
//
//  Created by User on 25/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension InsideCornerDimenions: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = insideCornerTV.dequeueReusableCell(withIdentifier: "WrappingDoorCell", for: indexPath) as! WrappingDoorCell
        cell.xLabel.text = "&"
        cell.widthTextField.placeholder = "Feet"
        cell.heightTextfield.placeholder = "Inch."
        cell.widthTextField.tag = indexPath.row
        cell.heightTextfield.tag = indexPath.row
        cell.dimensionLabel.text = "Height of Inside Corner \(indexPath.row + 1):"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
}


