//
//  DoorWrapList.swift
//  NextStone
//
//  Created by Hakikat Singh on 08/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension DoorWrapControl: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doorTableView.dequeueReusableCell(withIdentifier: "DoorWindowCell", for: indexPath) as! DoorWindowCell
        cell.TopLabel.text = "Dimension of Door \(indexPath.row + 1) :"
        cell.feetWidthTF.tag = indexPath.row
        cell.inchesWidthTF.tag = indexPath.row
        cell.feetHeightTF.tag = indexPath.row
        cell.inchesHeightTF.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
}



