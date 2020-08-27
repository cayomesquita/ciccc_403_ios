//
//  DetailViewController.swift
//  TodoCoreData
//
//  Created by Cornerstone on 2020-08-26.
//  Copyright © 2020 Cornerstone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.title!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: ManagedTodo? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

