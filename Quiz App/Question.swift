//
//  Quiz.swift
//  Quiz App
//
//  Created by Paul Szydlowski on 28/08/2016.
//  Copyright © 2016 pawisoon. All rights reserved.
//

import Foundation
import UIKit

class Question {
    //MARK: Properties
    // We keep 3 variables on each quiz
    var question: String
    var status: Bool //was touched before
    var q_pic: UIImage?
    var a1: String
    var a2: String
    var a3: String
    var a4: String
    
    
    //MARK: Initialisation
    
    init?(question: String, status:Bool, q_pic: UIImage?, a1:String, a2:String, a3: String, a4:String){
        self.question = question
        self.status = status
        self.q_pic = q_pic
        self.a1 = a1
        self.a2 = a2
        self.a3 = a3
        self.a4 = a4
        
        if question.isEmpty || status.boolValue == false {
            return nil
        }
        
    }
    
    
}



