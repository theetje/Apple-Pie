//
//  Game.swift
//  Apple Pie
//
//  Created by Thomas De lange on 12-11-17.
//  Copyright © 2017 Thomas De lange. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
