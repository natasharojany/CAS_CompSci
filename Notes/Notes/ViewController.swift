//
//  ViewController.swift
//  Notes
//
//  Created by Lance Davenport on 11/14/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var note:Note?
    
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.text = note?.note
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        note?.note = noteTextView.text
    }
    
}

