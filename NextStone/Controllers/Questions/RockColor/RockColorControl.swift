//
//  RockColorControl.swift
//  NextStone
//
//  Created by Hakikat Singh on 02/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class RockColorControl: AbstractControl {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rockColorCollectionView: UICollectionView!
    
    var dataModel : RockColorBaseClass!
    var materialId: String!
    let refresh = UIRefreshControl()
    var nameId: String!
    
    class func controlWithName(_ name: String!) -> RockColorControl {
        let control = self.control as! RockColorControl
        control.nameId = name
        return control
    }
    
    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        questionLabel.text = "What color \((nameId)!) would you like?"
        
        //registering cell
        let xib = UINib(nibName: "MaterialSelectionCell", bundle: nil)
        rockColorCollectionView.register(xib, forCellWithReuseIdentifier: "MaterialSelectionCell")
        
        //registering footerview
        let footerView = UINib(nibName: "MaterialFooterView", bundle: nil)
        rockColorCollectionView.register(footerView, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "MaterialFooterView")
    }
    
    //MARK:- FUNCTIONS
    func getData(){
        MaterialCalculatorStore.sharedInstance.requestRandomRocksColor { (dict) in
            self.dataModel = dict
            self.rockColorCollectionView.reloadData()
            self.refresh.endRefreshing()
        }
    }
}
