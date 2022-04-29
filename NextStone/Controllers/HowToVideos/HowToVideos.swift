//
//  HowToVideos.swift
//  NextStone
//
//  Created by Mobile on 10/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

enum Video {
    case panel, cover
}

class HowToVideos: AbstractControl, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: IBOutlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var panelsTableView: UITableView!
    @IBOutlet var coversTableView: UITableView!
    
    //MARK: Variables
    var type: Video = .panel
    
    //MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViews([panelsTableView, coversTableView])
    }
    
    //MARK: Tableview register
    func registerTableViews(_ tableViews: Array<UITableView>) {
        for tableView in tableViews {
            tableView.register(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
            tableView.estimatedRowHeight = 50.0
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = .clear
            tableView.showsVerticalScrollIndicator = false
        }
    }
    
    //MARK: Action Buttons
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        scrollView.setContentOffset(CGPoint(x: scrollView.bounds.size.width * (CGFloat(sender.selectedSegmentIndex)), y: 0), animated: true)
        type = sender.selectedSegmentIndex == 0 ? .panel : .cover
        panelsTableView.reloadData()
        coversTableView.reloadData()
    }
    
    //MARK: UITableView Datasources And Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case .panel:
            return Localstore.shared.panelVideo.count
        case .cover:
            return Localstore.shared.coverVideo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        switch type {
        case .panel:
            cell.updateWithModel(Localstore.shared.panelVideo[indexPath.row])
        case .cover:
            cell.updateWithModel(Localstore.shared.coverVideo[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch type {
        case .panel:
            let url = Localstore.shared.panelVideo[indexPath.row].url
            _ = SafariControl.openURL(url!)
        case .cover:
            let url = Localstore.shared.coverVideo[indexPath.row].url
            _ = SafariControl.openURL(url!)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
}


