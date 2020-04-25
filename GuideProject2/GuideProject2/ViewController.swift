//
//  ViewController.swift
//  GuideProject2
//
//  Created by Cornerstone on 2020-04-25.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["house","computer","bottle"]
    
    let incorrectMovesAllowed = 7
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
    
    var currentGame: Game!
    
    @IBAction func buttonPressed(_ sender:
        UIButton) {
        sender.isEnabled = false
        let letter = Character((sender.title(for: .normal)!.lowercased()))
        self.currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound(){
        if listOfWords.isEmpty {
            enableLetterButtons(false)
        } else {
            let word = listOfWords.removeFirst()
            self.currentGame = Game(word: word, incorrectWordRemainong: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
        }
        updateUI()
    }

    func updateUI(){
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectWordRemainong)")
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
    }
    
    func updateGameState(){
        if currentGame.incorrectWordRemainong == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }

    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}

