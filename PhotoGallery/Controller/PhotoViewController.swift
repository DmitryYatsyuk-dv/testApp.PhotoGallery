//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Lucky on 06/04/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    //MARK: Variables
    var image: UIImage?
    
    //MARK: IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        photoImageView.image = image
        photoImageView.contentMode = .scaleAspectFill
        
        
    }
    @IBAction func shareAction(_ sender: UIButton) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        // File Delivery Tracking
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Successfully delivered")
            }
        }
        
        present(shareController, animated: true, completion: nil)
        
        
    }
    
}
