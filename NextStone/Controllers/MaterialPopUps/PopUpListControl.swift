//
//  PopUpListControl.swift
//  NextStone
//
//  Created by Mobile on 06/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import SDWebImage

extension MaterialPopUpControl: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //MARK:- return number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK:- return number of rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray != nil ? (imagesArray!.count) : 0
    }
    
    //MARK:- return cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = materialCollectionPopupView.dequeueReusableCell(withReuseIdentifier: "MaterialPopUpCell", for: indexPath) as! MaterialPopUpCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(imagesArray![indexPath.row]))
        cell.popupCollectionImageView.setShowActivityIndicator(true)
        cell.popupCollectionImageView.setIndicatorStyle(.gray)
        cell.popupCollectionImageView.sd_setImage(with: URL(string: imageUrl))
        return cell
    }
}


