//
//  GalleryStore.swift
//  NextStone
//
//  Created by User on 26/06/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

class GalleryStore: BaseApiStore {

    static let sharedinstance = GalleryStore()
    
    func getGalleryImages(completion: @escaping (_ : BaseGalleryImages?, _ : Int) -> Void) {
        let url = String(APIS.GALLERY_LIST)
        requestBaseGetAPI(url) { (dict) in
            if dict?["status"] as! Int == 1 {
                completion(BaseGalleryImages.init(object: dict!), dict?["status"] as! Int)
            } else {
                completion(nil ,0)
            }
        }
    }
}
