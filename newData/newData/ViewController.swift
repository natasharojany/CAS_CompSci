//
//  ViewController.swift
//  newData
//
//  Created by Lance Davenport on 12/5/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        }
        
        // This just puts the file contents (unparsed) into the label.
        if let string = jsonFileString {
            myLabel.text = string
        }
        
        if let data = jsonFileData {
            // TODO: Parse the JSON data and display it in the app.
            let json = try? JSONSerialization.jsonObject(with: jsonFileData!, options: [])
            let dictionary: [String: Any] = json as! [String: Any]
            let name: String = dictionary["Name"] as! String
            let food: [String] = dictionary["Food"] as! [String]
            let birthYear: Int = dictionary["BirthYear"] as! Int
            myLabel.text = ("Hi! My name is \(name) and I was born in \(birthYear). Some foods I like are: \(food.joined(separator: ", ")).")
            
        }
        
    }
}


