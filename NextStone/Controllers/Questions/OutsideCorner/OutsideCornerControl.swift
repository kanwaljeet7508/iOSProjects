//
//  OutsideCornerControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 03/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class OutsideCornerControl: AbstractControl {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var outsideCornerCollectionView: UICollectionView!
    
    var dataModel : RockColorBaseClass!
    let refresh = UIRefreshControl()
    var nameId : String!
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        outsideCornerCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        outsideCornerCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }

    //MARK:- FUNCTIONS
    func getData(){
        MaterialCalculatorStore.sharedInstance.requestOutsideCorner { (dict) in
            self.dataModel = dict
            self.outsideCornerCollectionView.reloadData()
            self.refresh.endRefreshing()
        }
    }
    
}


