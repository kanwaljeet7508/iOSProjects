//
//  API.swift
//  NextStone
//
//  Created by Hakikat Singh on 16/04/18.
//  Copyright © 2018 Hakikat Singh. All rights reserved.
//

import UIKit

struct APIS {
    
    //TEST URL'S
//    static let BASE_URL = "http://live.csdevhub.com/nextstone/ws/"
//    static let BASE_API_URL = "\(BASE_URL)v1/index.php/"
//    static let BASE_IMAGE_URL = "\(BASE_URL)uploads/images/"

//LIVE URL'S
    static let BASE_URL = "http://api.nextstone.com/"
    static let BASE_API_URL = "\(BASE_URL)v1/index.php/"
    static let BASE_IMAGE_URL = "\(BASE_URL)uploads/images/"

    /*_____Register_____*/
    static let REQUEST_REGISTER = "\(BASE_API_URL)register"
    
    /*_____Login_____*/
    static let REQUEST_LOGIN = "\(BASE_API_URL)login"
    
    /*_____RandomRockPanels_____*/
    static let REQUEST_RANDOM_ROCKS = "\(BASE_API_URL)random_rock_panels"
    
    /*_____Outside_Corner_____*/
    static let REQUEST_OUTSIDE_CORNER = "\(BASE_API_URL)outside_corner"
    
    /*_____Inside_Corner_____*/
    static let REQUEST_INSIDE_CORNER = "\(BASE_API_URL)inside_corner"
    
    /*_____Transition_____*/
    static let REQUEST_TRANSITION = "\(BASE_API_URL)transition"
    
    /*_____Termination_____*/
    static let REQUEST_TERMINATION = "\(BASE_API_URL)termination"
    
    /*_____Contact_Us_____*/
    static let REQUEST_CONTACT_US = "\(BASE_API_URL)contactus"
    
    /*_____Request_forgot_password_____*/
    static let REQUEST_FORGOT_PASSWORD = "\(BASE_API_URL)forgot_password"
    
    /*_____Submitt_all_questions_____*/
    static let REQUEST_SUBMIT_QUESTIONS = "\(BASE_API_URL)submit_material"
    
    /*_____ABOUT_US_____*/
    static let ABOUT_US = "\(BASE_URL)about-us/about-us.html"
    
    /*_____HOW_TO_ORDER_SAMPLES____*/
    static let How_order_samples = "\(BASE_URL)order_sample/index.html"
    
    /*_____Show_pdf_list_____*/
    static let REQUEST_PDF_LIST = "\(BASE_API_URL)material_details"
    
    /*____Gallery____*/
    static let GALLERY_LIST = "\(BASE_API_URL)galleryImages"
 
    /*____Delete Pdf____*/
    static let DELETE_PDF = "\(BASE_API_URL)material_details"

    /*____Last PDF____*/
    static let lastPdfFile = "\(BASE_API_URL)lastMaterialId"
    
    static let PRODUCT_SPECIFICATION = "\(BASE_IMAGE_URL)Specifications_Mobile%20App.pdf"
    
    static let PDF_FILE = "\(BASE_URL)uploads/pdf/"
    
    /*_____Dealer Form_____*/
    static let REQUEST_DEALER = "\(BASE_API_URL)dealer"

    
    /*____360____*/
    static let IMAGES_CATEGORIES = "\(BASE_API_URL)images360"
    
    static let BASE_IMAGE_CATEGORIES_URL = "\(BASE_URL)uploads/360_images/"
    
}
