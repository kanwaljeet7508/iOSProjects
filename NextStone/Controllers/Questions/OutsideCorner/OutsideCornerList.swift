//
//  OutsideCornerList.swift
//  NextStone
//
//  Created by Hakikat Singh on 03/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension OutsideCornerControl: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
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
        let cell = outsideCornerCollectionView.dequeueReusableCell(withReuseIdentifier: "MaterialSelectionCell", for: indexPath) as! MaterialSelectionCell
        let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_URL,(dataModel.colorData?[indexPath.row].image)!)
        cell.cellImageView.setShowActivityIndicator(true)
        cell.cellImageView.setIndicatorStyle(.gray)
        cell.cellImageView.sd_setImage(with: URL(string: imageUrl))
        cell.materialNameLabel.text = (dataModel.colorData?[indexPath.row].name)! + " Outside Corner"
        return cell
    }
    
    //MARK:-return  footerview to the collection view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = outsideCornerCollectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView", for: indexPath) as! MaterialFooterView
        view.popUpImageView.image = UIImage(named: className())
        view.noneButton.actionBlock {
            if view.noneButton.image == #imageLiteral(resourceName: "untcik") {
                self.saveLocalData("0")
                Localstore.shared.outsideCorners = "0"
                Localstore.shared.outsideCornersArray = []
                self.navigationController?.pushViewController(InsideCornerControl.control, animated: true)
            }
            self.setNoneImage(view.noneButton)
        }
        view.backButton.addTarget(self, action: #selector(backButtonClicked(sender:)), for: .touchUpInside)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/2.0 - 5.0
        return CGSize(width: width, height: width + 95)
    }
    
    func setNoneImage(_ button: UIButton) {
        DispatchQueue.main.async {
            button.image = button.image == #imageLiteral(resourceName: "tick") ? #imageLiteral(resourceName: "untcik") : #imageLiteral(resourceName: "tick")
        }
    }
    
    @objc func backButtonClicked(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:-selection of the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nameId = "\(indexPath.row)"
        saveLocalData((dataModel.colorData?[indexPath.row].internalIdentifier)!)
        pushControl()
    }
    
    func saveLocalData(_ value: String) {
        var base = UserStore.sharedInsatnce.baseModel
        base?.outsideConer = value
        UserStore.sharedInsatnce.baseModel = base
    }
    
    func pushControl() {
        navigationController?.pushViewController(OutsideCornersTable.controlWithName(self.nameId), animated: true)
    }
}
