//
//  ViewController.swift
//  dynamicViews
//
//  Created by Lance Davenport on 2/6/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIButton, let number = Int(sender.titleLabel?.text ?? "x"), let vsvc = segue.destination as? VerticalStackViewController {
            vsvc.labelCount = number
        }
    }

}

