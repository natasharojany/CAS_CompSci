//
//  ViewController.swift
//  AgeFinder
//
//  Created by Lance Davenport on 9/19/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var birthdaySwitch: UISwitch!
    @IBOutlet weak var birthYearField: UILabel!
    @IBOutlet weak var ageButton: UIButton!
    
    var age:Int?
    var birthYear = 0
    var currentYear = 2019
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ageButton(_ sender: UIButton) {
        age = Int(ageTextField.text ?? "0")
        
        if birthdaySwitch.isOn {
            birthYear += 0
        } else{
            birthYear += 1
        }
        
        birthYear += currentYear
        birthYear -= age!
        
        birthYearField.text = "Your birth year is \(birthYear)"
        
        birthYear = 0
    }
    
}

