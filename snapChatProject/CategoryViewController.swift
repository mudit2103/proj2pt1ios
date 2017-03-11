//
//  CategoryViewController.swift
//  snapChatProject
//
//  Created by Mudit Gupta on 3/10/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    
    @IBOutlet weak var selectedCategory: UILabel!
    @IBOutlet weak var categoryTable: UITableView!
    var categoryThatIsSelected: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.delegate = self
        categoryTable.dataSource = self
        selectedCategory.text = "Select something ya dumb brat @_@"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func didPressSendPostButton(_ sender: Any) {
        if let selectedImage = ImagePickerController.selectedImage {
            if let category = categoryThatIsSelected {
                if threads[category] != nil {
                    threads[category]!.append(selectedImage)
                    seen[category]!.append(false)
                    timeSent[category]!.append(Date())
                }
            }
        }
        
        //performs the unwind segue
        //performSegue(withIdentifier: "unwindCategories", sender: nil)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "unwindCategories",sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindCategories" {
            if let dest = segue.destination as? ImagePickerController {
                
                    
                    dest.displayAlert = true
                    
                }
                
            }
        }
    
    
    //Delegate and datasource methods//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickCategoryCell", for: indexPath) as! categoryViewCell
        cell.categoryLabel.text = threadNames[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory.text = String("You have stupidly selected: ") + threadNames[indexPath.item]
        categoryThatIsSelected = threadNames[indexPath.item]
    }
}
