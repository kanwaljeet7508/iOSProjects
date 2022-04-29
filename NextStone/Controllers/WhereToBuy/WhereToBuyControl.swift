//
//  WhereToBuyControl.swift
//  NextStone
//
//  Created by Mobile on 10/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

enum Buy {
    case commercial, retail, canada
}

class WhereToBuyControl: AbstractControl, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var commercialTableView: UITableView!
    @IBOutlet var retailTableView: UITableView!
    @IBOutlet var canadaTableView: UITableView!
    
    var type: Buy = .retail
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViews([commercialTableView , retailTableView , canadaTableView])
        commercialTableView.tableHeaderView = commercialHeader
        retailTableView.tableHeaderView = retailHeader
    }
    
    let commercialHeader: BuyHeader = {
        let header = BuyHeader()
        header.title = "NextStone products are available online or as a Special Order item from all retailers below. Please visit their websites or their Commercial Services Departments."
        return header
    }()
    
    let retailHeader: BuyHeader = {
        let header = BuyHeader()
        header.title = "NextStone products are available as a Special Order item from select dealers below. Please contact your local dealer for availability."
        return header
    }()
    
    func registerTableViews(_ tableViews: Array<UITableView>) {
        for tableView in tableViews {
            tableView.register(UINib.init(nibName: "WhereBuyCell", bundle: nil), forCellReuseIdentifier: "WhereBuyCell")
            tableView.estimatedRowHeight = 50.0
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = .clear
            tableView.showsVerticalScrollIndicator = false
        }
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * (CGFloat(sender.selectedSegmentIndex)), y: 0), animated: true)
        let value = sender.selectedSegmentIndex //== 0 ? .commercial : .retail
        switch value {
        case 0:
            type = .retail
        case 1:
            type = .commercial
        case 2:
            type = .canada
        default: break
        }
        commercialTableView.reloadData()
        retailTableView.reloadData()
        canadaTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case .commercial:
            return Localstore.shared.commercailStores.count
        case .retail:
            return Localstore.shared.retailStores.count
              case .canada:
            return Localstore.shared.canadaStores.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhereBuyCell") as! WhereBuyCell
        switch type {
        case .commercial:
            cell.updateWithModel(Localstore.shared.commercailStores[indexPath.row])
        case .retail:
            cell.updateWithModel(Localstore.shared.retailStores[indexPath.row])
        case .canada:
            cell.updateWithModel(Localstore.shared.canadaStores[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch type {
        case .commercial:
            let url = Localstore.shared.commercailStores[indexPath.row].link
            _ = SafariControl.openLink(url!)
        case .retail:
            let url = Localstore.shared.retailStores[indexPath.row].link
            _ = SafariControl.openLink(url!)
        case .canada:
            let url = Localstore.shared.canadaStores[indexPath.row].link
            _ = SafariControl.openLink(url!)
        }
    }
}
