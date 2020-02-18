//
//  mediumNumberViewController.swift
//  numberGuesser
//
//  Created by Lance Davenport on 2/18/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class mediumNumberViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 1...45 {
                   let newButton = UIButton()
                   newButton.setTitle("BUTTON \(i)", for: .normal)
                   newButton.frame = CGRect(x: 0, y: 0, width: 400, height: 25)
                   newButton.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.5, blue: 0.6, alpha: 1)
                   stackView.addArrangedSubview(newButton)
                    newButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
               }
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: 1550)
        scrollView.contentSize = CGSize(width: 400, height: 1550)
    }
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
}
