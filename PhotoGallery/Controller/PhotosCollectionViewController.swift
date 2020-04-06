//
//  PhotosCollectionViewController.swift
//  PhotoGallery
//
//  Created by Lucky on 05/04/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: Variables
    
    let photos = ["photo1", "photo2", "photo14", "photo15",
                  "photo6", "photo10", "photo9", "photo7",
                  "photo11", "photo12", "photo13", "photo4", "photo5",
                  "photo16", "photo17"]
    
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    
    //MARK: ViewLifecycle & For Example - Second way to configure Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        For Example.
        //        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.itemSize = CGSize(width: 70, height: 30)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //        layout.minimumLineSpacing = 10
        //        layout.minimumInteritemSpacing = 10
        //        collectionView.showsVerticalScrollIndicator = false
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.artImageView.image
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.artImageView.image = image
        
        return cell
    }
}

//MARK: DelegateFlowLayout. First way to configure Layout

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Calculations for Layout items
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1) // Indent (right/left/between) in string for items
        let availableWidth = collectionView.frame.width - paddingWidth // Screen width - ↑
        let widthPerItem = availableWidth / itemsPerRow // Get the exact width for the object
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // Indent between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    // Setting the distance between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    // Setting the distance between items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
