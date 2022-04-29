//
//  PdfStore.swift
//  NextStone
//
//  Created by Hakikat Singh on 25/05/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit
import Alamofire

class PdfStore: BaseApiStore {

    static let sharedInstance = PdfStore()
    
    func requestPdfList(_ userId: String, _ page: Int , _ completion: @escaping(_ : BasePdfListClass?, _ : Int) -> Void){
        let url = "\(APIS.REQUEST_PDF_LIST)/\(userId)/\(page)" 
        requestBaseGetAPI(url) { (dict) in
            if dict?["status"] as! Int == 1{
                completion(BasePdfListClass.init(object: dict!), dict?["status"] as! Int)
            }else{
                completion(nil,0)
            }
        }
    }
    
    func deletePdfFile(_ id : String , _ completion: @escaping( _ : Bool) -> Void) {
        let url = String(format: "%@/%@", APIS.DELETE_PDF,id)
        requestAPI(url, requestType: .delete) { (dict) in
            if dict?["status"] as! Int == 1 {
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    func requestlastPdfList(_ userId: String, _ completion: @escaping(_ : Bool, _ : String) -> Void){
        let url = "\(APIS.lastPdfFile)/\(userId)"
        requestBaseGetAPI(url) { (dict) in
            if dict?["status"] as! Int == 1{
                let data = dict?["data"] as! [String : Any]
                let id = data["id"] as! String
                print(id)
                completion(true , id)
            }else{
                completion(false , "0")
            }
        }
    }
}
