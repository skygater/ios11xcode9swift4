//
//  ViewController.swift
//  Memory game
//
//  Created by Djordje Kalezic on 27/11/2018.
//  Copyright © 2018 Djordje Kalezic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var lableCount: UILabel!
    
    @IBOutlet var collectionButton: [UIButton]!
    
    var emojiz = ["👻","🎃","👻","🎃"]
    @IBAction func onCLick(_ sender: UIButton) {
        //print("The button is clicked")
        counter+=1
        lableCount.text = "Fliped count: \(self.counter)"
        if let indexEmo = collectionButton.index(of: sender){
            changeSides(withEmoji: emojiz[indexEmo], on: sender)
        }else{
            print("Error");
        }
        
    }
    
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

