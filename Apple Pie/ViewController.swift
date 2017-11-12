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
    
    // Bijhouden score. (WAS EERST let........)
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }

    // Verbinding met de view (knoppen en lables) plus een hanler van de knoppen.
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    // is buttonTapped maar achterlijke voorbeeld noemde het eerst buttonPressed en ik blijf slepen.
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterSting = sender.title(for: .normal)!
        let letter = Character(letterSting.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // Initializatie van de Game struct in currentGame.
    var currentGame: Game!
    
    // Functie voor het starten van een nieuwe ronden.
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    // Functie die het bord bijhoud, boom en scorelables.
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

