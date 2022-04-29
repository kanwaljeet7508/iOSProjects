//
//  GalleryControl.swift
//  NextStone
//
//  Created by Mac on 08/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class GalleryControl: AbstractControl {
    
    //MARK:- IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    //MARK:- Variables
    var dataModel : BaseGalleryImages!
    var speciesSearchResult = [Any]()
    var filtered:[String] = []
    var searchActive : Bool = false
    var backUp : BaseGalleryImages!
    var srchArray = [BaseGalleryImages]()
    
    var filterArray : [Gallery]!
    var galleryArray = [Gallery]()
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.showsCancelButton = true
        getGalleryImages()
        setupCollectionView()
    }
    
    //MARK:- Functions
    func getGalleryImages() {
        GalleryStore.sharedinstance.getGalleryImages { (galleryList,status) in
            if status == 1 {
                self.dataModel = galleryList
                self.backUp = galleryList
                self.galleryArray = (galleryList?.data)!
                self.filterArray = (galleryList?.data)!
                self.collectionView.reloadData()
            } else {
                
            }
        }
    }
    
    //MARK:- CollectionView Setup
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib.init(nibName: "GalleryCell", bundle: nil), forCellWithReuseIdentifier: "GalleryCell")
        let width = UIScreen.main.bounds.size.width-30
        flowLayout.itemSize = CGSize(width: width/2, height: width/2)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 0
    }
}

extension GalleryControl: UISearchBarDelegate, UISearchDisplayDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        galleryArray.removeAll()
        if searchText.length != 0 {
            for i in 0 ... (dataModel.data?.count)! - 1 {
                if ((dataModel.data?[i].name!.lowercased() as! NSString).range(of: searchText.lowercased())).location != NSNotFound {
                    galleryArray.append((dataModel.data?[i])!)
                }
            }
        } else {
            galleryArray = filterArray
        }
        self.collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
