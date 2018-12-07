//
//  ViewController.swift
//  tictactoe
//
//  Created by Noirdemort on 04/11/18.
//  Copyright © 2018 Noirdemort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func selectAction(_ sender: Any) {
        let selection  = sender as! UIButton
        print(selection.tag)
        playGame(selection: selection)
    }
    
    var activePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(selection: UIButton){
        if activePlayer == 1{
            selection.setTitle("X", for: UIControl.State.normal)
            selection.backgroundColor = UIColor(red: 100/255, green: 230/255, blue: 150/255, alpha: 0.5)
            player1.append(selection.tag)
            activePlayer = 2
        } else {
            selection.setTitle("O", for: UIControl.State.normal)
            selection.backgroundColor = UIColor(red: 200/255, green: 130/255, blue: 120/255, alpha: 0.5)
            player2.append(selection.tag)
            activePlayer = 1
        }
        selection.isEnabled = false
        getWinner()
    }
    
    func getWinner(){
        var winner = -1;
        
        if player1.contains(1) && player1.contains(2) && player1.contains(3){
            winner = 1;
        }
        
        if player1.contains(4) && player1.contains(5) && player1.contains(6){
            winner = 1;
        }
        
        if player1.contains(7) && player1.contains(8) && player1.contains(9){
            winner = 1;
        }
        
        if player2.contains(1) && player2.contains(2) && player2.contains(3){
            winner = 2;
        }
        
        if player2.contains(4) && player2.contains(5) && player2.contains(6){
            winner = 2;
        }
        if player2.contains(7) && player2.contains(8) && player2.contains(9){
            winner = 2;
        }
        
        if player1.contains(1) && player1.contains(4) && player1.contains(7) || player1.contains(2) && player1.contains(5) && player1.contains(8) || player1.contains(3) && player1.contains(6) && player1.contains(9) {
            winner = 1;
        }
        
        if player2.contains(1) && player2.contains(4) && player2.contains(7) || player2.contains(2) && player2.contains(5) && player2.contains(8) || player2.contains(3) && player2.contains(6) && player2.contains(9) {
            winner = 2;
        }
        
        if player1.contains(1) && player1.contains(5) && player1.contains(9) || player1.contains(3) && player1.contains(5) && player1.contains(7) {
            winner = 1;
        }
        
        if player2.contains(1) && player2.contains(5) && player2.contains(9) || player2.contains(3) && player2.contains(5) && player2.contains(7) {
            winner = 2;
        }
        
        if winner != -1{
            let alert = UIAlertController(title: "Yay", message: "Player \(winner) won the game", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil))
                self.present(alert,animated: true, completion: nil)
        }
    }
}

