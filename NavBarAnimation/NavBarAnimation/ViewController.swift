//
//  ViewController.swift
//  NavBarAnimation
//
//  Created by Cornerstone on 2020-05-21.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    
    var initialHeight:CGFloat = CGFloat.init()
    let endHeight = 200
    
    var isOpen: Bool {
        return self.navBarHeight.constant == CGFloat(endHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialHeight = navBarHeight.constant
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        let closing = isOpen
        self.navBarHeight.constant = closing ? CGFloat(initialHeight) : CGFloat(endHeight)
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.25, initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.plusButton.transform = CGAffineTransform.init(rotationAngle: closing ? 0 : .pi/4)
                        }
        )
    }
    
}

