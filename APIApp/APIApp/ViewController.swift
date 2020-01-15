//
//  ViewController.swift
//  APIApp
//
//  Created by Lance Davenport on 12/19/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseGame()
    }
    // One function - you give it a number, gets that game
    // One function takes the name of a game, adds it to the label
    //
    func parseGame() {
        let url: URL = URL(string:     "https://www.giantbomb.com/api/games/?api_key=5094689370c2cf4ae42a2a268af0595badb1fea8&format=json&field_list=name")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            print(json ?? "Couldn't get JSON")
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    guard let results = dictionary["results"] as? [[String:Any]]  else { return }
                    for result in results {
                        guard let name = result["name"] as? String else { return }
                        textView.text = "\(textView.text ?? "")\nName: \(name)"
                    }
                  
                }
            }
        }
    }
    
    @IBAction func randomGame(_ sender: Any) {
        let number = Int.random(in: 0 ..< 71002)
        let url: URL = URL(string:     "https://www.giantbomb.com/api/game/3030-\(number)/?api_key=5094689370c2cf4ae42a2a268af0595badb1fea8&format=json&field_list=name")!
        print(url)
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            print(json ?? "Couldn't get JSON")
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let result = dictionary["results"] as! [String:String]?
                    if let result = result {
                        let name = result["name"] as! String?
                        if let name = name {
                            label.text = "Name: \(name)"
                        }
                    }
                }
            }
        }
    }
}








