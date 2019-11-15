//
//  ViewController.swift
//  Boats
//
// Created by Lance Davenport on 11/14/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var boat:Boat?
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var name = boat?.name
        var color = boat?.color
        var dolphinPower = boat?.dolphonPower
        var size = boat?.size
        nameLabel.text = name
        detailListLabel.text = "Color: \(color!) Power: \(dolphinPower!) Size: \(size!)"
        
    }
    
    
}
