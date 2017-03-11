//
//  ImageDisplayViewController.swift
//  snapChatProject
//
//  Created by Mudit Gupta on 3/10/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageDisplayViewController: UIViewController {

    
    @IBOutlet weak var imageButton: UIButton!
    var imageToSet: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageButton.setImage(imageToSet, for: .normal)
        imageButton.imageView?.contentMode = .scaleToFill
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedImage(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToFeed", sender: nil)
    }
    
    
    
    

}
