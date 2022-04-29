//
//  ImagesThreeSixtyViewController.swift
//  NextStone
//
//  Created by Mobile on 26/03/19.
//  Copyright © 2019 Hakikat Singh. All rights reserved.
//

import UIKit
import SDWebImage

class ImagesThreeSixtyViewController: AbstractControl {

    @IBOutlet weak var img_View: UIImageView!
    
//    var currentIndex: Int = 0 {
//        didSet {
//            let imageUrl = String(format: "%@%@",APIS.BASE_IMAGE_CATEGORIES_URL,(img_Array[currentIndex]))
//            img_View.sd_setImage(with: URL(string: imageUrl))
//        }
//    }
//    var images: [UIImage] = [UIImage]()
//    var lastPoint: CGPoint = CGPoint.zero
//    let sensitivity: CGFloat = 5.0
    var selectedGif = ""
//    var img_Array = [String]()
//    var dataModel : [ThreeSixtyCategoriesImagesData] = []
    
    class func control(_ catId: String) -> ImagesThreeSixtyViewController {
        let control = self.control as! ImagesThreeSixtyViewController
        control.selectedGif = catId
        return control
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getApiResponse()
//        self.view.backgroundColor = .white
//        loadGif()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadGif()
    }
    
    func loadGif() {
        let gifURL : String = "\(APIS.BASE_IMAGE_CATEGORIES_URL)\(selectedGif)"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = self.img_View.frame
        view.addSubview(imageView3)
        view.bringSubview(toFront: imageView3)
    }
    
//    func getApiResponse() {
//        UserStore.sharedInsatnce.requestThreeSixtyImages(catIds, completion: { (dict, value) in
//            if value == 1 {
//                for i in 0..<(dict?.data?.count)! {
//                    self.img_Array.append((dict?.data![i].image)!)
//                }
//            }
//            self.currentIndex = 0
//        })
//    }
    
//    @IBAction func gesture(_ sender: UIPanGestureRecognizer) {
//        let currentPoint = sender.location(in: img_View)
//        if sender.state == .began {
//            lastPoint = currentPoint
//        } else if sender.state == .changed {
//            let velocity = sender.velocity(in: img_View)
//            if velocity.x > 0 && currentPoint.x > lastPoint.x + sensitivity {
//                currentIndex = currentIndex > 0 ? currentIndex - 1 : img_Array.count - 1
//                lastPoint = currentPoint
//            } else {
//                if currentPoint.x < lastPoint.x - sensitivity {
//                    currentIndex = currentIndex < img_Array.count - 1 ? currentIndex + 1 : 0
//                    lastPoint = currentPoint
//                }
//            }
//        }
//    }

}
