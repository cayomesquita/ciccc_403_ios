//
//  QuestionViewController.swift
//  GuidedProject3
//
//  Created by Cornerstone on 2020-05-08.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionIndex = 0
    
    var question: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                        ]),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleep", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eat", type: .dog)
                        ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
                        ])
    ]
    
    var answersChosen: [Answer] = []
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultViewController = segue.destination as! ResultsViewController
            resultViewController.response = answersChosen
        }
    }
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = question[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(question.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressBar.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
    }

    func updateSingleStackView(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStackView(using answers: [Answer]){
        multipleStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updateRangedStackView(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = question[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswer[0])
        case singleButton2:
            answersChosen.append(currentAnswer[1])
        case singleButton3:
            answersChosen.append(currentAnswer[2])
        case singleButton4:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswer = question[questionIndex].answers
        
        if multipleSwitch1.isOn {
            answersChosen.append(currentAnswer[0])
        }
        if multipleSwitch2.isOn {
            answersChosen.append(currentAnswer[1])
        }
        if multipleSwitch3.isOn {
            answersChosen.append(currentAnswer[2])
        }
        if multipleSwitch4.isOn {
            answersChosen.append(currentAnswer[3])
        }
        
        nextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswer = question[questionIndex].answers
        
        let index = Int(rangedSlider.value * Float(currentAnswer.count - 1))
        
        answersChosen.append(currentAnswer[index])
        
        nextQuestion()
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < question.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
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
