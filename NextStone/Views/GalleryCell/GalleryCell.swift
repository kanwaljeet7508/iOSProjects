
//
//  imageCell.swift
//  CollectionListDemo
//
//  Created by CS_Mac4 on 25/05/17.
//  Copyright © 2017 CS_Mac4. All rights reserved.
//

import UIKit
import SimpleImageViewer

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var labelView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        perform(#selector(initViews), with: self, afterDelay: 0.1)
    }
    
    func updateWithModel(_ model: Gallery) {
        labelView.layer.borderWidth = 1
        labelView.layer.borderColor = Constants.THEME_COLOR.cgColor
        imageView.setShowActivityIndicator(true)
        imageView.setIndicatorStyle(.gray)
        imageView.sd_setImage(with: model.imageURL)
        nameLabel.text = model.name
    }
    
    @objc func initViews() {
        imageView.actionBlock {
            self.imageClicked()
        }
    }
    
    //MARK: Image action to show
    func imageClicked() {
        let config = ImageViewerConfiguration { config in
            config.imageView = imageView
        }
        let imageViewer = ImageViewerController(configuration: config)
        UIApplication.visibleViewController.present(imageViewer, animated: true)
    }
    
}


