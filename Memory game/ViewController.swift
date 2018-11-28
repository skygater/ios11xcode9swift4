//
//  ViewController.swift
//  Memory game
//
//  Created by Djordje Kalezic on 27/11/2018.
//  Copyright © 2018 Djordje Kalezic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // can have method  {didSet{}}
    var counter = 0
    // Lazy counts as initilize -
    lazy var game = Memory(numberOfPairsOfCard: (collectionButton.count+1) / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Labels ar vars
    @IBOutlet weak var lableCount: UILabel!
    // Array of buttons
    @IBOutlet var collectionButton: [UIButton]!
    //Array of emoji
    var emojiChoices = ["👻","🎃","🦇","😱","😈","🍭","🍬","🍎","🙀"]
    
    //Button action function
    @IBAction func onCLick(_ sender: UIButton) {
        //print("The button is clicked")
        counter+=1
        lableCount.text = "Fliped count: \(self.counter)"
        if let indexEmo = collectionButton.index(of: sender){
            game.chooseCard(at: indexEmo)
            updateViewFromModel()
        }else{
            print("Error");
        }
        
    }
    
    //OurFunc
    func updateViewFromModel(){
        for index in collectionButton.indices{
            let button = collectionButton[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for:UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.428736237, green: 0.428736237, blue: 0.428736237, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
            
            
        }
    }
    
    var emoji = Dictionary<Int,String> ()
    //Our func
    func emoji (for card: Card) -> String{
        if emoji[card.identifire] == nil{
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifire] = emojiChoices.remove(at: randomIndex)
            }
        }
        if emoji[card.identifire] != nil{
            return emoji[card.identifire]!
        }else{
            return "?"
        }
        
    }
    //Our function
    func changeSides(withEmoji emoji:String, on button:UIButton) {
        if (button.currentTitle == ""){
            button.setTitle(emoji, for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            button.setTitle("", for:UIControl.State.normal)
        }
    }
    
    
    
    
}

