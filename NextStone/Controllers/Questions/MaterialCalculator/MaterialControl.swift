//
//  MaterialControl.swift
//  NextStone
//
//  Created by Mobile on 02/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class MaterialControl: AbstractControl {
    
    //MARK: IBOutlets
    @IBOutlet weak var materialSelectionLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectionCollectionView: UICollectionView!
    
    //MARK: Variables
    var dataModel : BaseMaterialClass!
    let refresh = UIRefreshControl()
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        selectionCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        selectionCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }
    
    //MARK:- FUNCTIONS
    func getData() {
        MaterialCalculatorStore.sharedInstance.requestRandomRocks { (dict) in
            self.dataModel = dict
            self.selectionCollectionView.reloadData()
        }
    }
}



