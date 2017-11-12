//
//  ViewController.swift
//  Apple Pie
//
//  Created by Thomas De lange on 12-11-17.
//  Copyright © 2017 Thomas De lange. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Lijst met woorden die geraden moet worden.
    var listOfWords = ["buccaneer", "swift", "glorious","incandescent", "bug", "program"]
    // Aantal keer dat geraden mag worden.
    let incorrectMovesAllowed = 7
    
    // Bijhouden score.
    let totalWins = 0
    let totalLosses = 0

    // Verbinding met de view (knoppen en lables) plus een hanler van de knoppen.
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // Initializatie van de Game struct in currentGame.
    var currentGame: Game!
    
    // Functie voor het starten van een nieuwe ronden.
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    // Functie die het bord bijhoud, boom en scorelables.
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

