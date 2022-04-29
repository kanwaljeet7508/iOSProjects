//
//  TerminationControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class TerminationControl: AbstractControl {

    //MARK: IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var terminationCollectionView: UICollectionView!
    
    //MARK: Variables
    var dataModel : RockColorBaseClass!
    let refresh = UIRefreshControl()
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        terminationCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        terminationCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }
    
    //MARK:- FUNCTIONS
    func getData() {
        MaterialCalculatorStore.sharedInstance.requestTermination { (dict) in
            self.dataModel = dict
            self.terminationCollectionView.reloadData()
            self.refresh.endRefreshing()
        }
    }
}


