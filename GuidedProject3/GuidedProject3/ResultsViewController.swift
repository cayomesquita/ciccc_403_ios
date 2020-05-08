//
//  ResultsViewController.swift
//  GuidedProject3
//
//  Created by Cornerstone on 2020-05-08.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var response: [Answer]!
    
    @IBOutlet var resultaAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequenceOfAnswer: [AnimalType: Int] = [:]
        
        let responseTypes = response.map {$0.type}
        
        for answer in responseTypes {
            let newCount: Int
            
            if let OldCount = frequenceOfAnswer[answer] {
                newCount = OldCount + 1
            } else {
                newCount = 1
            }
            
            frequenceOfAnswer[answer] = newCount
        }
        
//        let frequenceAnswerSorted = frequenceOfAnswer.sorted { (pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        }
        
        let mostCommonAnswer = frequenceOfAnswer.sorted {$0.1 > $1.1} .first!.key
    
        resultaAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
