//
//  Memory.swift
//  Memory game
//
//  Created by Djordje Kalezic on 28/11/2018.
//  Copyright © 2018 Djordje Kalezic. All rights reserved.
//

import Foundation

class Memory {
    
    var cards = Array<Card>()
     var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index:Int){
        
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifire == cards[index].identifire{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
            
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false;
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                ///either no cards or 2 cards are face uo
            }
        }
        
        
        
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }else {
//            cards[index].isFaceUp = true
//        }
    }
    
    init(numberOfPairsOfCard:Int){
        
        for _ in 1...numberOfPairsOfCard{
            let card = Card()
            cards += [card,card]
        }
    }
    
    
}
