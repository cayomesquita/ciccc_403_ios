//
//  Game.swift
//  GuideProject2
//
//  Created by Cornerstone on 2020-04-25.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectWordRemainong: Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessWord = ""
        for letter in word {
            guessWord += guessedLetters.contains(letter) ? "\(letter)" : "_"
        }
        return guessWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectWordRemainong -= 1
        }
    }
}
