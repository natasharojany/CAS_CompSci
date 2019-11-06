//
//  ViewController.swift
//  XRDSDictionary
//
//  Created by Lance Davenport on 11/5/19.
//  Copyright © 2019 Lance Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deflabel: UILabel!
    var vocabWord:String?
    var vocabWordDefinition:String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = vocabWord
        deflabel.text = vocabWordDefinition

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
