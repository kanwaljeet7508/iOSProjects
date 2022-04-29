//
//  360CategoriesViewController.swift
//  NextStone
//
//  Created by Mobile on 26/03/19.
//  Copyright © 2019 Hakikat Singh. All rights reserved.
//

import UIKit

class ImagesCategoriesViewController: AbstractControl {

    @IBOutlet weak var tblView_Categories: UITableView!
    var dataModel : [ThreeSixtyCategoriesData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView_Categories.register(UINib(nibName: "ThreeSixtyTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreeSixtyTableViewCell")
        getApiResponse()
    }

    func getApiResponse() {
        UserStore.sharedInsatnce.requestThreeSixtyCategories { (Categories, value) in
            if value == 1 {
                for i in 0..<(Categories?.data?.count)! {
                    self.dataModel.append((Categories?.data![i])!)
                    self.tblView_Categories.reloadData()
                }
            }
        }
    }
}

extension ImagesCategoriesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeSixtyTableViewCell") as! ThreeSixtyTableViewCell
        cell.lbl_title.text = dataModel[indexPath.row].category
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ImagesThreeSixtyViewController.control(dataModel[indexPath.row].image!), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
