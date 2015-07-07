//
//  ViewController.swift
//  Tic_Tac_Toe
//
//  Created by Dan Morton on 7/1/15.
//  Copyright © 2015 Dan Morton. All rights reserved.
//

import UIKit

struct ThreeNumSequence{
    let a : Int
    let b : Int
    let c : Int
}

class ViewController: UIViewController {

    var playerSwitch = true
    @IBOutlet var labels: [UILabel]!
    var markedPlayerOneLabels = [UILabel]()
    var markedPlayerTwoLabels = [UILabel]()
    
    let possibleWinningSequences = [
        ThreeNumSequence(a: 0, b: 1, c: 2),
        ThreeNumSequence(a: 3, b: 4, c: 5),
        ThreeNumSequence(a: 6, b: 7, c: 8),
        ThreeNumSequence(a: 0, b: 4, c: 8),
        ThreeNumSequence(a: 2, b: 4, c: 6),
        ThreeNumSequence(a: 0, b: 3, c: 6),
        ThreeNumSequence(a: 1, b: 4, c: 7),
        ThreeNumSequence(a: 2, b: 5, c: 8)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HGelo")
    }
    
    @IBAction func userTapped(sender: UITapGestureRecognizer) {
        for x in labels{
            if x.frame.contains(sender.locationOfTouch(0, inView: self.view)) && (x.text != "x" && x.text != "o"){
                //mark the label that was tapped
                if playerSwitch{
                    x.text = "x"
                    markedPlayerOneLabels.append(x)
                }
                else {
                    x.text = "o"
                    markedPlayerTwoLabels.append(x)
                }
                
                //check if there was a winner
                let gameOver = checkForWinner(playerSwitch)
                if gameOver {
                    if playerSwitch{ displayEndOfGameMenu("Player one won!") }
                    else { displayEndOfGameMenu("Player two won!") }
                }
                else if markedPlayerOneLabels.count + markedPlayerTwoLabels.count >= 9{
                    displayEndOfGameMenu("Cats game!")
                }
                else{
                    playerSwitch = !playerSwitch
                }
            }
        }
    }
    
    func checkForWinner(playerBoolean: Bool) -> Bool{
        let labelArray : [UILabel]!
        if (playerSwitch){ labelArray = markedPlayerOneLabels }
        else { labelArray = markedPlayerTwoLabels }
        
        for x in possibleWinningSequences{
            let conditionOne = labelArray.containsElementWithTag(x.a)
            let conditionTwo = labelArray.containsElementWithTag(x.b)
            let conditionThree = labelArray.containsElementWithTag(x.c)
            
            if (conditionOne && conditionTwo && conditionThree) { return true }
        }
        
        return false
    }
    
    func displayEndOfGameMenu(title: String){
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let restartAction = UIAlertAction(title: "Restart", style: UIAlertActionStyle.Default) { (action) -> Void in
            self.configureNewGame()
        }
        
        alert.addAction(restartAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func configureNewGame(){
        markedPlayerOneLabels.removeAll()
        markedPlayerTwoLabels.removeAll()
        labels.clearAllLabels()
        playerSwitch = true
    }
    
}

extension Array where T : UILabel{
    func containsElementWithTag(tag:Int) -> Bool{
        for x in self{
            if x.tag == tag{
                return true
            }
        }
        return false
    }
    
    func clearAllLabels(){
        for x in self{
            x.text = ""
        }
    }
}