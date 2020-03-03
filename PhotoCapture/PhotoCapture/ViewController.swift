//
//  ViewController.swift
//  PhotoCapture
//
//  Created by Natasha Rojany on 3/2/20.
//  Copyright © 2020 Natasha Rojany. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //why is this not working?
    var takerController: UIImagePickerController!
    @IBOutlet weak var galleryButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    var photos: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                }
            }
            
        default:
            return
        }
    }

    
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
        
    }
    @IBAction func takePhoto(_ sender: Any) {
        takeIt()
    }
    
    func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        let image = info[.originalImage] as? UIImage
        photos.append(image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  gallery = segue.destination as? galleryViewController, let sender = sender as? UIButton  {
            if sender == galleryButton {
                gallery.images = photos
            }
            
            
        }
}

}
