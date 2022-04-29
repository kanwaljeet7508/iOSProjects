//
//  InsideCornerList.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension InsideCornerControl: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel != nil ? (dataModel.colorData?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = insideCornerCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(dataModel.colorData?[indexPath.row].image)!)
        cell.cellImageView.setShowActivityIndicator(true)
        cell.cellImageView.setIndicatorStyle(.gray)
        cell.cellImageView.sd_setImage(with: URL(string: imageUrl))
        cell.materialNameLabel.text = (dataModel.colorData?[indexPath.row].name)! + " Inside Corner"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view =
            insideCornerCollectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView", for: indexPath) as! MaterialFooterView
        view.popUpImageView.image = #imageLiteral(resourceName: "04")
        view.noneButton.actionBlock {
            if view.noneButton.image == #imageLiteral(resourceName: "untcik") {
                self.saveLocalData("0")
                Localstore.shared.insideCorners = "0"
                Localstore.shared.insideCornersArray = []
                self.pushControl()
            }
            self.setNoneImage(view.noneButton)
        }
        view.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        saveLocalData((dataModel.colorData?[indexPath.row].internalIdentifier)!)
        
        if dataModel.colorData?[indexPath.row].name == "Sandstone" {
            navigationController?.pushViewController(InsideCornerDimenions.control, animated: true)
        } else {
            Localstore.shared.insideCorners = ""
            Localstore.shared.insideCornersArray = []
            pushControl()
        }
    }
    
    //MARK: Set Image
    func setNoneImage(_ button: UIButton) {
        DispatchQueue.main.async {
            button.image = button.image == #imageLiteral(resourceName: "tick") ? #imageLiteral(resourceName: "untcik") : #imageLiteral(resourceName: "tick")
        }
    }

    //MARK: Save Data
    func saveLocalData(_ value: String) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.insideCorner = value
        UserStore.sharedInsatnce.baseModel = base
    }
    
    //MARK: NAvigate View
    func pushControl() {
        navigationController?.pushViewController(TransitionControl.control, animated: true)
    }
    
    //MARK: Back Button Action
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


