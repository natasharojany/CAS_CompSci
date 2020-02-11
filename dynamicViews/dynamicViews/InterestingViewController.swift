//
//  InterestingViewController.swift
//  dynamicViews
//
//  Created by Lance Davenport on 2/10/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
//

import UIKit

class InterestingViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    var labelCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let pictures = (1...labelCount).map({(x) -> UIImageView in
            let newImage = "Mountain"
            let image = UIImage(named: newImage)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            return imageView
        })
        for (x, pictures) in pictures.enumerated() {
            stackView.addArrangedSubview(pictures)
           let constraint = NSLayoutConstraint(item: pictures, attribute: .height, relatedBy: .equal, toItem: pictures, attribute: .height, multiplier: 1, constant: 1)
            let mult = 1.0 / Double(labelCount - 1)
            if pictures != pictures[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
    
}
