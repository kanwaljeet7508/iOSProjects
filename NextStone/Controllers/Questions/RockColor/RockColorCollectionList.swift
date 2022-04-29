//
//  RockColorCollectionList.swift
//  NextStone
//
//  Created by Hakikat Singh on 02/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//


import UIKit

extension RockColorControl: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //MARK:-return number of section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK:-return number of rows in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel != nil ? (dataModel.colorData?.count)! : 0
    }
    
    //MARK:-return the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rockColorCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(dataModel.colorData?[indexPath.row].image)!)
        cell.cellImageView.setShowActivityIndicator(true)
        cell.cellImageView.setIndicatorStyle(.gray)
        cell.cellImageView.sd_setImage(with: URL(string: imageUrl))
        cell.materialNameLabel.text = dataModel.colorData?[indexPath.row].name
        return cell
    }
    
    //MARK:-return  footerview to the collection view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = rockColorCollectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView", for: indexPath) as! MaterialFooterView
        view.noneButton.isHidden = true
        view.popUpImageView.image = #imageLiteral(resourceName: "PanelProfilePopup")
        view.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        return view
    }
    
    //MARK:-selection of the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.randomRockPanel = dataModel.colorData?[indexPath.row].internalIdentifier
        UserStore.sharedInsatnce.baseModel = base
        navigationController?.pushViewController(OutsideCornerControl.control, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 350)
    }
    
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


