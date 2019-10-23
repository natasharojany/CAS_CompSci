//
//  ViewController.swift
//  IceCreamPicker
//
//  Created by Lance Davenport on 10/21/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var PickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return IceCream.count
    }
    var IceCream: Dictionary = [
        5: "Cookie Dough",
        4: "Vanilla",
        3: "Chocolate",
        6: "Sherbert"
    ]
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let list = Array(IceCream.values)
        return list[row]
    }
    
    @IBAction func OrderIce(_ sender: Any)  {
        let row = PickerView.selectedRow(inComponent: 0)
        let name = Array(IceCream.values)
        let price = Array(IceCream.keys)
        
        Label.text = "You ordered: " + name[row] + " and it will cost $" + String(price[row])
    }
    
    
}

