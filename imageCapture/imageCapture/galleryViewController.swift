//
//  galleryViewController.swift
//  imageCapture
//
//  Created by Lance Davenport on 2/27/20.
//  Copyright © 2020 Lance Davenport. All rights reserved.
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
    @IBAction func captionButton(_ sender: UIButton) {
        return 
    }
    
    func loadPhotos(){
        let pictures = images.map({(image) -> UIImageView in
            let newImageView = UIImageView()
            newImageView.image = image
            newImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
            return newImageView
        })
        for (_, image) in pictures.enumerated() {
            stackView.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pictures[0], attribute: .height, multiplier: 1, constant: 1)
            stackView.addArrangedSubview(image)
            if image != pictures[0] {
                stackView.addConstraint(constraint)
            }
        }
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
