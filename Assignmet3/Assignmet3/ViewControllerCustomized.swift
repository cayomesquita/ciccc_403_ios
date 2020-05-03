//
//  ViewControllerCustomezed.swift
//  Assignmet3
//
//  Created by Cornerstone on 2020-05-02.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import Foundation

import UIKit

class ViewControllerCustomized: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = backRootBarButtonItem()
        // Do any additional setup after loading the view.
    }

    func backRootBarButtonItem() -> UIBarButtonItem {
        let backRootButton = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(goToDoor))
        
        return backRootButton
    }
    
    @objc func goToDoor(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}
