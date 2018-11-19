//
//  Pattern.swift
//  PatternProject
//
//  Created by Kyla Vidallo on 2018-11-15.
//  Copyright © 2018 Kyla Vidallo. All rights reserved.
//

import Foundation

class Pattern {
    let colorSequence: String
    let answer1 : Bool
    let answer2 : Bool
    let answer3 : Bool
    let answer4 : Bool
    
    
    init(playersPattern: String, playerAns1: Bool, playerAns2 : Bool, playerAns3 : Bool, playerAns4: Bool) {
       
        colorSequence = playersPattern
        answer1 = playerAns1
        answer2 = playerAns2
        answer3 = playerAns3
        answer4 = playerAns4
        
    }
}
