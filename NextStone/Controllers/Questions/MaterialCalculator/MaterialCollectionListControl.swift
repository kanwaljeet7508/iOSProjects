//
//  MaterialListControl.swift
//  NextStone
//
//  Created by Mobile on 03/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import SDWebImage

extension MaterialControl: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel != nil ? (dataModel.materialData?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = selectionCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(dataModel.materialData?[indexPath.row].firstImage)!)
        cell.cellImageView.setShowActivityIndicator(true)
        cell.cellImageView.setIndicatorStyle(.gray)
        cell.cellImageView.sd_setImage(with: URL(string: imageUrl))
        cell.materialNameLabel.text = dataModel.materialData?[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = selectionCollectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView", for: indexPath) as! MaterialFooterView
        view.noneButton.isHidden = true
        view.popUpImageView.image = UIImage(named: className())
        view.backButton.isHidden = true
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var base = BaseSubmitQuestionClass.init(object: "")
        base.panelProfile = dataModel.materialData?[indexPath.row].internalIdentifier
        UserStore.sharedInsatnce.baseModel = base
        Localstore.shared.rockProfileId = dataModel.materialData?[indexPath.row].internalIdentifier
        navigationController?.pushViewController(RockColorControl.controlWithName(dataModel.materialData?[indexPath.row].name), animated: true)
        
//        DispatchQueue.main.async {
//            MaterialPopUpControl.showControl((self.dataModel.materialData?[indexPath.row].images)!, (self.dataModel.materialData?[indexPath.row].name)!)
//        }
    }
    
}


