//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    static var selectedImage: UIImage? = nil
    
    var alert:UIAlertController!
    
    var displayAlert: Bool? = nil
    
    func showAlert() {
        self.alert = UIAlertController(title: "Snap sent", message: "Ooh la la wowzer m8", preferredStyle: UIAlertControllerStyle.alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(ImagePickerController.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        // Dismiss the alert from here
        self.alert.dismiss(animated: true, completion: nil)
        displayAlert = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if displayAlert == true {
            showAlert()
        }
    }
    
    
    @IBOutlet var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.collectionViewLayout = ImageFlowLayout.init()
        self.imageCollectionView.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        ImagePickerController.selectedImage = image
    }
    
    //This method is required for swift to recognize the unwindSegue
    //This is weird. Don't question it.
    @IBAction func unwindSegue(unwindSegue:UIStoryboardSegue)  {
    
    }

    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as! imageCollectionVieCell
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! imageCollectionVieCell
        
        selectImage(selectedCell.image.image!)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "imageToCategories",sender: self)
        }
    }

}
