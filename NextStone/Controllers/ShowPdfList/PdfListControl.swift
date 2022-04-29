//
//  PdfListControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 25/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class PdfListControl: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet weak var noRecordLabel: UILabel!
    @IBOutlet weak var pdfListCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //MARK: Variables
    var dataModel : [PdfData] = []
    var page = 1
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        noRecordLabel.isHidden = true
        getPdfList(page)
        setupCollectionView()
    }
    
    //get data from api
    func getPdfList(_ page : Int) {
        PdfStore.sharedInstance.requestPdfList(UserStore.sharedInsatnce.userId!,page) { (baseList,status) in
            if status == 1 {
                for i in 0..<(baseList?.pdfData?.count)! {
                    self.dataModel.append((baseList?.pdfData![i])!)
                }
                self.noRecordLabel.isHidden = true
                self.pdfListCollectionView.reloadData()
            } else {
                self.noRecordLabel.isHidden = false
            }
        }
    }
    
    //MARK: Setup CollectionView
    func setupCollectionView() {
        pdfListCollectionView.delegate = self
        pdfListCollectionView.dataSource = self
        pdfListCollectionView.showsVerticalScrollIndicator = false
        pdfListCollectionView.showsHorizontalScrollIndicator = false
        pdfListCollectionView.register(UINib.init(nibName: "MaterialSelectionCell", bundle: nil), forCellWithReuseIdentifier: "MaterialSelectionCell")
        let width = UIScreen.main.bounds.size.width-30
        flowLayout.itemSize = CGSize(width: width/2, height: width/2)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 0
    }
}
