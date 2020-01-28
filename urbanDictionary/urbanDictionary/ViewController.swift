//
//  ViewController.swift
//  urbanDictionary
//
//  Created by Lance Davenport on 1/20/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var posField: UITextField!
    @IBOutlet weak var defView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
   
    func fileUrl() -> URL {
        let documentURL = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("data.json")
    }
    
    @IBAction func addWords(_ sender: UIButton) {
        let data: [String:String] = [
            "Name": nameField.text ?? "N/A",
            "Part of Speech": posField.text ?? "N/A",
            "Definition": defView.text ?? "N/A"
        ]
        
        var wordstoSave: [[String:String]] = []
        if var oldWords:[[String : String]] = getJsonData() as [[String:String]]? {
            oldWords.append(data)
            wordstoSave = oldWords
        } else {
            wordstoSave = [data]
        }
        
    
        let anotherSorted = wordstoSave.sorted(by: {
            (a, b) in
            return a["Name"]! < b["Name"]!
        })
        
        let url = fileUrl()
        if let jsonData = try? JSONSerialization.data(withJSONObject: anotherSorted, options: []) {
            try? jsonData.write(to: url)
            print(data)
            nameField.text = ""
            defView.text = ""
            posField.text = ""
        } else {
            print("Failed to save")
        }
    }
    
    func getJsonData() -> [[String:String]]? {
        let url = fileUrl()
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let dictionary: [[String:String]] = json as? [[String:String]] {
                return dictionary
            }
        }
        return nil
    }
    
    func allData() {
        textView.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for wordEntry in dictionary {
                let name: String = wordEntry["Name"]!
                let definition: String = wordEntry["Definition"]!
                let pos: String = wordEntry["Part of Speech"]!
                print(name, definition, pos)
                textView.text = textView.text! + "\nName: \(name)(\(pos))\n Defintion: \(definition)\n"
            }
        }
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        textView.text = ("")
        let dictionary = getJsonData()
        if let dictionary = dictionary {
            for wordEntry in dictionary {
                let name: String = wordEntry["Name"]!
                let definition: String = wordEntry["Definition"]!
                let pos: String = wordEntry["Part of Speech"]!
                print(name, definition, pos)
                textView.text = textView.text! + "\nName: \(name)(\(pos))\n Defintion: \(definition)\n"
            }
        }
    }
    
    @IBAction func clearData(_ sender: UIButton) {
        let url = fileUrl()
        try? FileManager.default.removeItem(at:url)
        textView.text = ""
    }
    
    
}

