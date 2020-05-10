//
//  ViewController.swift
//  TipCalculator
//
//  Created by Cornerstone on 2020-05-09.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipPercentageTextField: UITextField!
    @IBOutlet var tipPercentageSlider: UISlider!
    @IBOutlet var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipPercentageTextField.percentValue = tipPercentageSlider.value
//        if let view = calculateButton.superview {
//            view.backgroundColor = .blue
//            view.layer.cornerRadius = 20
//        }
    }

    

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        calculateTip()
    }
    
    func calculateTip(){
        if let billAmount = billAmountTextField.floatValue {
            tipAmountLabel.text = String.init(format: "$ %.2f", billAmount * tipPercentageSlider.value)
        } else {
            tipAmountLabel.text = ""
        }
    }

    @IBAction func billAmountTextFieldFilled(_ sender: UITextField) {
        calculateTip()
    }
    @IBAction func tipPercentageTextFieldFilled(_ sender: UITextField) {
        tipPercentageSlider.value = sender.floatValue! / 100
        calculateTip()
    }
    
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        let tipValue = sender.value
        print(tipValue)
        tipPercentageTextField.percentValue = tipValue
        calculateTip()
    }
}

extension UITextField {
    var floatValue: Float?{
        let numberFormatter = NumberFormatter.init()
        numberFormatter.numberStyle = .decimal
        let number = numberFormatter.number(from: text!)?.floatValue
        return number
    }
    
    var percentValue: Float?{
        get {
            let numberFormatter = NumberFormatter.init()
            numberFormatter.numberStyle = .decimal
            if let number = numberFormatter.number(from: text!)?.floatValue {
                    return number / 100
            } else {
                return nil
            }
        }
        set (newVlaue) {
            var value: Float?
            if let percent = newVlaue {
                value = percent * 100
            }
            self.text = value == nil ? nil : String.init(format: "%.0f", value!)
        }
    }
}

