//
//  VerticalStack.swift
//  dynamicViews
//
//  Created by Lance Davenport on 2/6/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//
import UIKit

class VerticalStackViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var labelCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({(x) -> UITextView in
            let newView = UITextView()
            newView.text = "Hi buddy! \(x)"
            return newView
        })
        for (x, label) in labels.enumerated() {
            stackView.addArrangedSubview(label)
            label.textAlignment = .center
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            let mult = 1.0 / Double(labelCount - 1)
//            label.backgroundColor = UIColor(displayP3Red: CGFloat(mult*Double(x)), green: CGFloat(1-mult*Double(x)), blue: CGFloat(mult*Double(x)), alpha: 1)
            stackView.addArrangedSubview(label)
            if label != labels[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
}

