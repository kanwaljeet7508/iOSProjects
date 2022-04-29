//
//  DimensionControlList.swift
//  NextStone
//
//  Created by User on 10/07/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension DimensionControl : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoorWindowCell", for: indexPath) as! DoorWindowCell
        cell.TopLabel.text = " "
        cell.feetWidthTF.tag = indexPath.row
        cell.inchesWidthTF.tag = indexPath.row
        cell.feetHeightTF.tag = indexPath.row
        cell.inchesHeightTF.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93.0
    }
}
