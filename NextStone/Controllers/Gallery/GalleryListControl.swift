//
//  Gall.swift
//  NextStone
//
//  Created by Mac on 08/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

extension GalleryControl: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.galleryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
        DispatchQueue.dispatch_async_main {
            if self.galleryArray.count > indexPath.row {
                 cell.updateWithModel(self.galleryArray[indexPath.row])
            }
        }
        return cell
    }
}


