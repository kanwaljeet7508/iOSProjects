//
//  TransitionControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 04/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class TransitionControl: AbstractControl {

    //IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var transitionCollectionView: UICollectionView!
    
    //MARK: Variables
    var dataModel : RockColorBaseClass!
    let refresh = UIRefreshControl()
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        transitionCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        transitionCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }

    //MARK:- FUNCTIONS
    func getData(){
        MaterialCalculatorStore.sharedInstance.requestTransition { (dict) in
            self.dataModel = dict
            self.transitionCollectionView.reloadData()
            self.refresh.endRefreshing()
        }
    }

}


