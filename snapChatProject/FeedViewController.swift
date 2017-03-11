//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Mudit Gupta on 3/10/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var alert:UIAlertController!
    @IBOutlet weak var myFeedTable: UITableView!
    var selectedIndexPath: IndexPath = []
    override func viewDidLoad() {
        super.viewDidLoad()
        myFeedTable.delegate = self
        myFeedTable.dataSource = self
        myFeedTable.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //when the view appears, reload the data!
        //tbh i spent far too long on this
        myFeedTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if threads[threadNames[section]]! == [] {
            return 0
        }
        else {
            return threads[threadNames[section]]!.count
        }
//
    }
    
    func showAlert() {
        self.alert = UIAlertController(title: "LMAO", message: "Do you think you're very clever by trying to see already seen snaps? Z SNAP", preferredStyle: UIAlertControllerStyle.alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FeedViewController.dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        // Dismiss the alert from here
        self.alert.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionNumber = indexPath.section
        let imageNumber = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFeedTableCell", for: indexPath) as! feedTableCell
        
        cell.feedTableCellLabel.text = "Mudit Gupta"
        if (seen[threadNames[sectionNumber]]?[imageNumber])! == true {
            cell.seenImage.image = #imageLiteral(resourceName: "read")
        } else {
            cell.seenImage.image = #imageLiteral(resourceName: "unread")
        }
        
        cell.timeElapsed.text = getTimeDiff(sentDate: (timeSent[threadNames[sectionNumber]]?[imageNumber])!)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedCategory.text = String("You have stupidly selected: ") + threadNames[indexPath.item]
        selectedIndexPath = indexPath
        let sectionNumber = selectedIndexPath.section
        let imageNumber = selectedIndexPath.row
        
        if seen[threadNames[sectionNumber]]?[imageNumber] == false {
            seen[threadNames[sectionNumber]]?[imageNumber] = true
            performSegue(withIdentifier: "feedToImageDisplay", sender: nil)
            
        } else {
            
            
            showAlert()

        }
        
    }
    
    //This method is required for swift to recognize the unwindSegue
    //This is weird. Don't question it.
    @IBAction func unwindSegue(unwindSegue:UIStoryboardSegue)  {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedToImageDisplay" {
            if let dest = segue.destination as? ImageDisplayViewController {
                let sectionNumber = selectedIndexPath.section
                let imageNumber = selectedIndexPath.row
                if let array = threads[threadNames[sectionNumber]] {
                    let imageToUse = (array[imageNumber])
//                    if let buttonToUse = dest.imageButton {
//                        buttonToUse.setImage(imageToUse, for: .normal)
//                    }
                        
                    dest.imageToSet = imageToUse
                    
                }
                
            }
        }
        
        
    }

    



}
