//
//  ViewController.swift
//  Light
//
//  Created by Cornerstone on 2020-04-19.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    func updateUI(){
        view.backgroundColor = lightOn ? .white :.black
    }
    
}

