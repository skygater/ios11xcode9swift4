//
//  Card.swift
//  Memory game
//
//  Created by Djordje Kalezic on 28/11/2018.
//  Copyright © 2018 Djordje Kalezic. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifire:Int
    
    static var identifireFactory = 0
    
    static func getUniqueIdentifire () -> Int{
        identifireFactory += 1
        return identifireFactory
    }
    
    init(){
        self.identifire = Card.getUniqueIdentifire()
    }

    
}
