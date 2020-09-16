//
//  ViewController.swift
//  LandmarkBook
//
//  Created by testinium on 15.09.2020.
//  Copyright © 2020 testinium. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var lanmarkNames = [String]()
    var lanmarkImages = [UIImage]()
    @IBOutlet weak var tableView: UITableView!
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Landmark Book"
        
        tableView.delegate = self
        tableView.dataSource = self
    
        lanmarkNames.append("Guernica")
        lanmarkNames.append("Starry Night")
        lanmarkNames.append("The Persistence of Memory")
        lanmarkNames.append("Water Lilies")
    
        lanmarkImages.append(UIImage(named: "guernica")!)
        lanmarkImages.append(UIImage(named: "starryNight")!)
        lanmarkImages.append(UIImage(named: "thePersistenceOfMemory")!)
        lanmarkImages.append(UIImage(named: "waterLilies")!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = lanmarkNames[indexPath.row]
        
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return lanmarkNames.count
    }
    
    // deleting rows or indexes
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            lanmarkNames.remove(at: indexPath.row)
            lanmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.middle)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = lanmarkNames[indexPath.row]
        chosenLandmarkImage = lanmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toLanmarkImage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLanmarkImage" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    

}

