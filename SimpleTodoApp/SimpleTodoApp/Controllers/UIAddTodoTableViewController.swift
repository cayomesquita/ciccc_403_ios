//
//  UIAddTodoTableViewController.swift
//  SimpleTodoApp
//
//  Created by Cornerstone on 2020-05-17.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class UIAddTodoTableViewController: UITableViewController {

    @IBOutlet var titleTF: UITextField!
    @IBOutlet var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddButtonState()
    }

    @IBAction func onValueChanged(_ sender: UITextField) {
        print("onValueChanged")
        setupAddButtonState()
    }
    @IBAction func titleOnEditingChanged(_ sender: UITextField) {
        print("titleValueChanged")
        setupAddButtonState()
    }
    
    func setupAddButtonState(){
        if let titleTodo =  titleTF.text {
            addButton.isEnabled = titleTodo.count > 0
        } else {
            addButton.isEnabled = false
        }
    }
    
}
