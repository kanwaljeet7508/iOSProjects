//
//  TransitionList.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension TransitionControl:  UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel != nil ? (dataModel.colorData?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = transitionCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(dataModel.colorData?[indexPath.row].image)!)
        cell.cellImageView.setShowActivityIndicator(true)
        cell.cellImageView.setIndicatorStyle(.gray)
        cell.cellImageView.sd_setImage(with: URL(string: imageUrl))
        cell.materialNameLabel.text = dataModel.colorData?[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = transitionCollectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView", for: indexPath) as! MaterialFooterView
        view.noneButton.isHidden = true
        view.popUpImageView.image = UIImage(named: className())
        view.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.transition = dataModel.colorData?[indexPath.row].internalIdentifier
        UserStore.sharedInsatnce.baseModel = base

        /////////////////////////////////////////CHECK/////////////////////////////////////////
        
        if dataModel.colorData?[indexPath.row].name == "Wainscott" {
            navigationController?.pushViewController(LedgerControl.control, animated: true)
        } else {
            if UserStore.sharedInsatnce.baseModel.insideCorner == "2" {
                navigationController?.pushViewController(MiteredInsideCorner.control, animated: true)
            } else {
                //                navigationController?.pushViewController(LedgerControl.control, animated: true)
                navigationController?.pushViewController(TerminationControl.control, animated: true)
            }
        }

        
//        if dataModel.colorData?[indexPath.row].name == "Full Wall" {
//            navigationController?.pushViewController(TerminationControl.control, animated: true)
//        } else {
//            if UserStore.sharedInsatnce.baseModel.insideCorner == "2" {
//                navigationController?.pushViewController(MiteredInsideCorner.control, animated: true)
//            } else {
//                navigationController?.pushViewController(LedgerControl.control, animated: true)
//            }
//        }
    }
    
    //MARK: Back Button Action
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


