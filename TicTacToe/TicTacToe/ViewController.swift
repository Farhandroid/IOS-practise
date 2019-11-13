//
//  ViewController.swift
//  TicTacToe
//
//  Created by Advancer on 2019/11/11.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var btn_1: UIButton!
    
    @IBOutlet weak var btn_2: UIButton!
    
    @IBOutlet weak var btn_3: UIButton!
    
    @IBOutlet weak var btn_4: UIButton!
    
    
    @IBOutlet weak var btn_5: UIButton!
    
    
    @IBOutlet weak var btn_6: UIButton!
    
    @IBOutlet weak var btn_7: UIButton!
    
    @IBOutlet weak var btn_8: UIButton!
    
    @IBOutlet weak var btn_9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonClick(_ sender: Any) {
        let buSelect =  sender as! UIButton
        //print(buSelect.tag)
        playGame(buSelect: buSelect)
    }
    
    var ActivePlayer =  1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buSelect:UIButton){
        
        if ActivePlayer == 1 {
            buSelect.setTitle("X", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.5)
            player1.append(buSelect.tag)
            ActivePlayer =  2
            //print(player1)
            AutoPlay()
        }else{
             buSelect.backgroundColor = UIColor(red: 32/255, green: 192/255, blue: 243/255, alpha: 0.5)
            buSelect.setTitle("O", for: UIControl.State.normal)
             player2.append(buSelect.tag)
            ActivePlayer =  1
            //print(player2)
            
        }
        buSelect.isEnabled = false
        findWinner()
        
    }
    
    func findWinner()  {
        var winner = -1
        
        // row1
        if( player1.contains(1) &&  player1.contains(2) &&  player1.contains(3)){
            winner = 1
        }
        
        if( player2.contains(1) &&  player2.contains(2) &&  player2.contains(3)){
            winner = 2
        }
        
        // row2
        if( player1.contains(4) &&  player1.contains(5) &&  player1.contains(6)){
            winner = 1
        }
        
        if( player2.contains(4) &&  player2.contains(5) &&  player2.contains(6)){
            winner = 2
        }
        
        
        // row3
        if( player1.contains(7) &&  player1.contains(8) &&  player1.contains(9)){
            winner = 1
        }
        
        if( player2.contains(7) &&  player2.contains(8) &&  player2.contains(9)){
            winner = 2
        }
        
        
        // col1
        if( player1.contains(1) &&  player1.contains(4) &&  player1.contains(7)){
            winner = 1
        }
        
        if( player2.contains(1) &&  player2.contains(4) &&  player2.contains(7)){
            winner = 2
        }
        
        // col2
        if( player1.contains(2) &&  player1.contains(5) &&  player1.contains(8)){
            winner = 1
        }
        
        if( player2.contains(2) &&  player2.contains(5) &&  player2.contains(8)){
            winner = 2
        }
        
        // col3
        if( player1.contains(3) &&  player1.contains(6) &&  player1.contains(9)){
            winner = 1
        }
        
        if( player2.contains(3) &&  player2.contains(6) &&  player2.contains(9)){
            winner = 2
        }
        
        if winner != -1 {
            
            var msg = ""
            if winner == 1 {
               msg = " Player 1 is winner"
            }else{
              msg = " Player 2 is winner"
            }
            //print(msg)
            //show alert
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func AutoPlay(){
        
        //scan empty cells
        var emptyCells = [Int]()
        
        for index in 1...9 {
            
            if !(player1.contains(index) || player2.contains(index)){
               emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var buSelect:UIButton?
        switch cellID {
        case 1:
            buSelect = btn_1
        case 2:
            buSelect = btn_2
        case 3:
            buSelect = btn_3
        case 4:
            buSelect = btn_4
        case 5:
            buSelect = btn_5
        case 6:
            buSelect = btn_6
        case 7:
            buSelect = btn_7
        case 8:
            buSelect = btn_8
        case 9:
            buSelect = btn_9
        default:
                buSelect = btn_1
        }
        playGame(buSelect: buSelect!)
    }
}

