\//
//  InsideCornerDimensions.swift
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
        return Int(insideCornerTF.text!) != nil ? Int(insideCornerTF.text!)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = insideCornerTV.dequeueReusableCell(withIdentifier: "WrappingDoorCell", for: indexPath) as! WrappingDoorCell
        cell.heightTextfield.tag = indexPath.row
        cell.widthTextField.tag = indexPath.row
        cell.dimensionLabel.text = "Dimension of Door :"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
}

