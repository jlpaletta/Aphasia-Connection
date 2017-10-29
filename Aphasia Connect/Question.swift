//
//  Question.swift
//  phas
//
//  Created by Lucca Paletta on 10/28/17.
//  Copyright © 2017 jolupa. All rights reserved.
//

import Foundation
import UIKit

class Question{
    
    var ans1 = ""
    var ans2 = ""
    var ans3 = ""
    var ansC = ""
    var image : UIImage?
    
    
    init(makingthing answer1: String, answer2: String, answer3: String, answercorrect: String ){
        self.ans1 = answer1
        self.ans2 = answer2
        self.ans3 = answer3
        self.ansC = answercorrect
        self.image = UIImage(named: answercorrect)
        
    }
    
    
}
