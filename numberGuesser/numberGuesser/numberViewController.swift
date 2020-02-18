//
//  numberViewController.swift
//  numberGuesser
//
//  Created by Lance Davenport on 2/18/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class numberViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for i in 1...15 {
            let newButton = UIButton()
            newButton.setTitle("BUTTON \(i)", for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 25)
            newButton.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.5, blue: 0.6, alpha: 1)
            stackView.addArrangedSubview(newButton)
            newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 550)
        scrollView.contentSize = CGSize(width: 400, height: 850)
    }
    @objc func buttonAction(sender: UIButton!) {
            let number = Int.random(in: 0 ... 15)
            let correctAnswer = number
            if number == i {
               let alert = UIAlertController(title: "You got the correct answer", message: "", preferredStyle: .alert)
                self.present(alert, animated: true, completion: {})
                alert.addAction(UIAlertAction(title: "Yay", style: .default, handler: {(_) in return}))
            }
            
        }
        
        
}
