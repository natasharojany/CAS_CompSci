//
//  galleryViewController.swift
//  PhotoCapture
//
//  Created by Natasha Rojany on 3/2/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit

class galleryViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
   var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
        // Do any additional setup after loading the view.
    }
    
    func loadPhotos(){
        let pictures = images.map({(image) -> UIImageView in
            let newImageView = UIImageView()
            newImageView.image = image
            newImageView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
            return newImageView
        })
        let count = images.count
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: count*600)
        scrollView.contentSize = CGSize(width: 400, height: count*600)
        for (_, image) in pictures.enumerated() {
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pictures[0], attribute: .height, multiplier: 1, constant: 1)
            if image != pictures[0] {
                stackView.addConstraint(constraint)
            }
        }
    }
}

