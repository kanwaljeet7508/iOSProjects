//
//  PdfListExtension.swift
//  NextStone
//
//  Created by Hakikat Singh on 25/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension PdfListControl: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //return number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //return number of rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel.count != 0 ? (dataModel.count) : 0
    }
    
    //return cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pdfListCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let fileAddedOn = dataModel[indexPath.row].addedOn!
        cell.materialNameLabel.text = (dataModel[indexPath.row].fileName!) + "  " + (dateConvert(fileAddedOn))
        cell.cellImageView.image = #imageLiteral(resourceName: "pdf_icon")
        cell.cellImageView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (dataModel.count)-1 == indexPath.row && (dataModel.count) % (10*page) == 0{
            page += 1
            getPdfList(page)
        }
    }
    
    func dateConvert(_ date : String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy"
        let showDate = inputFormatter.date(from: date)
        let resultString = outputFormatter.string(from: showDate!)
        return resultString
    }
    
    //handle the cell selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        boolValue = true
        navigationController?.pushViewController(PdfControl.control((dataModel[indexPath.row].internalIdentifier)!), animated: true)
    }
}


