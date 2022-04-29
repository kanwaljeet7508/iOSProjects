//
//  InsideCornerControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class InsideCornerControl: AbstractControl {

    //MARK: IBOutlets
    @IBOutlet weak var insideCornerCollectionView: UICollectionView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Variables
    var dataModel : RockColorBaseClass!
    let refresh = UIRefreshControl()
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()
        
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        insideCornerCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        insideCornerCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }

    //MARK:- FUNCTIONS
    func getData(){
        MaterialCalculatorStore.sharedInstance.requestInsideCorner { (dict) in
            self.dataModel = dict
            self.insideCornerCollectionView.reloadData()
            self.refresh.endRefreshing()
        }
    }
}
