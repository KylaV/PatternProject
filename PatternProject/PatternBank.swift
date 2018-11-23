//
//  PatternBank.swift
//  PatternProject
//
//  Created by Kyla Vidallo on 2018-11-16.
//  Copyright © 2018 Kyla Vidallo. All rights reserved.
//

import Foundation

class PatternBank {
    var list = [Pattern]()
    
    init() {
        let item = Pattern(playersPattern: "Red - Green - Red - Green", playerAns1: false, playerAns2: true, playerAns3: false, playerAns4: true)
        
        list.append(item)
        
        list.append(Pattern(playersPattern: "Green - Green - Red - Green", playerAns1: true, playerAns2: true, playerAns3: false, playerAns4: true))
        list.append(Pattern(playersPattern: "Red - Red - Green - Red", playerAns1: false, playerAns2: false, playerAns3: true, playerAns4: false))
        list.append(Pattern(playersPattern: "Green - Red - Red - Green", playerAns1: true, playerAns2: false, playerAns3: false, playerAns4: true))
        list.append(Pattern(playersPattern: "Red - Green - Green - Red", playerAns1: false, playerAns2: true, playerAns3: true, playerAns4: false))
    }
}
