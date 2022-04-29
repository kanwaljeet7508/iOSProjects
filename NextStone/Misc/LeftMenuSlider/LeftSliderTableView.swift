//
//  LeftSliderTableView.swift
//  NextStone
//
//  Created by Mobile on 30/03/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension LeftSliderControl : UITableViewDelegate, UITableViewDataSource {
    
    //return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    //return cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leftSliderTableView.dequeueReusableCell(withIdentifier: "LeftSliderCell", for: indexPath) as! LeftSliderCell
        let customColorView = UIView()
        cell.selectedBackgroundView = customColorView
        cell.cellImageView.image = imageArray[indexPath.row]
        cell.cellLabel.text = stringArray[indexPath.row]
        if Localstore.shared.lastSelectedTableViewCell == indexPath.row {
            cell.backgroundColor = Constants.THEME_COLOR
            cell.cellLabel.textColor = UIColor.white
            cell.cellImageView.image = imageWhiteArray[indexPath.row]
        }
        return cell
    }
    
    //cell selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = leftSliderTableView.cellForRow(at: indexPath) as! LeftSliderCell
        if cell.isSelected {
            cell.cellImageView.image = imageWhiteArray[indexPath.row]
        } else {
            cell.cellImageView.image = imageArray[indexPath.row]
        }
        switch indexPath.row {
        case 0:
            Localstore.shared.lastSelectedTableViewCell = 0
            pushControl("AboutUsControl")
            break
        case 1:
            Localstore.shared.lastSelectedTableViewCell  = 1
            pushControl("MaterialControl")
            break
        case 2:
            Localstore.shared.lastSelectedTableViewCell  = 2
            pushControl("PdfListControl")
            //pushControl("Product_Specifications_Control")
            break
        case 3:
            Localstore.shared.lastSelectedTableViewCell  = 3
            pushControl("Product_Specifications_Control")
            //pushControl("PdfListControl")
            break
        case 4:
            Localstore.shared.lastSelectedTableViewCell  = 4
            pushControl("ImagesCategoriesViewController")
            //pushControl("SampleControl")
            break
        case 5:
            Localstore.shared.lastSelectedTableViewCell = 5
            pushControl("SampleControl")
            //pushControl("WhereToBuyControl")
            break
        case 6:
            Localstore.shared.lastSelectedTableViewCell  = 6
            pushControl("WhereToBuyControl")
            //pushControl("HowToVideos")
            break
        case 7:
            Localstore.shared.lastSelectedTableViewCell  = 7
            pushControl("HowToVideos")
            //pushControl("GalleryControl")
            break
        case 8:
            Localstore.shared.lastSelectedTableViewCell  = 8
            pushControl("GalleryControl")
            //pushControl("ContactControl")
        case 9:
            Localstore.shared.lastSelectedTableViewCell  = 9
            pushControl("ContactControl")
            //pushControl("ImagesCategoriesViewController")
        default: break
        }
        
    }
    
    func pushControl(_ name: String) {
        setControl((storyboard?.instantiateViewController(withIdentifier: name))!)
    }
    
    //cell deselection
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        leftSliderTableView.deselectRow(at: indexPath, animated: true)
        let cell = leftSliderTableView.cellForRow(at: indexPath) as! LeftSliderCell
        if cell.isSelected {
            cell.cellImageView.image = imageWhiteArray[indexPath.row]
        } else {
            cell.cellImageView.image = imageArray[indexPath.row]
        }
    }
    
    //height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
