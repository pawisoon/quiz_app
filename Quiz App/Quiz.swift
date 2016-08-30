//
//  Quiz.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 28/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    //MARK: Properties 
    // We keep 3 variables on each quiz
    var title: String
    var status: String
    var quiz_pic: UIImage?
    
    //MARK: Initialisation 
    
    init?(title: String, status:String, quiz_pic: UIImage?){
        self.title = title
        self.status = status
        self.quiz_pic = quiz_pic
        
        if title.isEmpty || status.isEmpty {
            return nil
        }
        
    }

    
}



