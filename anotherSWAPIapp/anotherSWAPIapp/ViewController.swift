//
//  ViewController.swift
//  anotherSWAPIapp
//
//  Created by Lance Davenport on 12/11/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func pressOne(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let director: String? = dictionary["director"] as? String
                    let releaseData: String? = dictionary["release_date"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label.text = "Title: \(title)\n It was released on: \(releaseData ?? "Can't find release date")\n Directed by: \(director ?? "Can't find director")\n Produced by: \(producer ?? "can't find producer")"
                    }
                }
            }
        }
    }
    @IBAction func pressTwo(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/4/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let director: String? = dictionary["director"] as? String
                    let releaseData: String? = dictionary["release_date"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label.text = "Title: \(title)\n It was released on: \(releaseData ?? "Can't find release date")\n Directed by: \(director ?? "Can't find director")\n Produced by: \(producer ?? "can't find producer")"
                    }
                }
            }
        }
    }
    @IBAction func pressThree(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/films/6/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let director: String? = dictionary["director"] as? String
                    let releaseData: String? = dictionary["release_date"] as? String
                    let producer: String? = dictionary["producer"] as? String
                    if let title = title {
                        label.text = "Title: \(title)\n It was released on: \(releaseData ?? "Can't find release date")\n Directed by: \(director ?? "Can't find director")\n Produced by: \(producer ?? "can't find producer")"
                    }
                }
            }
        }
    }
    
}

