//
//  developerTableViewController.swift
//  tableView
//
//  Created by Anand on 18/02/22.
//

import UIKit

struct Name {
    var name1: String
    var position: String
    var image: UIImage?
    var description: String
    
}

let mp = Name(name1: "Mohana Priya",
              position: "Web Developer",
              image: UIImage(named: "mohana"), description: "she is Good Knowledge in Web Program")

let vk = Name(name1: "Vignesh",
              position: "Android Developer",
              image: UIImage(named: "vignesh"), description: "He is Good Knowledge in Android Program")

let ar = Name(name1: "Aravind",
              position: "Web Developer",
              image: UIImage(named: "aravind"), description: "He is Good Knowledge in Web Program")

let nk = Name(name1: "Nikson",
              position: "Web Developer",
              image: UIImage(named: "nikson"), description: "He is Good Knowledge in Web Program")

let arjun = Name(name1: "Arjun",
                 position: "FullStack Developer",
                 image: UIImage(named: "Image"), description: "He is Good Knowledge in  Programs")

let jawahar = Name(name1: "Jawahar",
                   position: "Android Developer",
                   image: UIImage(named: "vignesh"), description: "He is Good Knowledge in Android Program")

class developerTableViewController: UITableViewController {
    
    let developers: [Name] = [ mp, vk, ar, nk, arjun, jawahar]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "staf-cell", for: indexPath) as! DeveloperCell
        
        let developer = developers[indexPath.row]
        cell.updateCell(name: developer)
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = developers[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "developerViewControllerID") as! developerViewController
        
        vc.player = player
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

class DeveloperCell: UITableViewCell{
    
    @IBOutlet weak var developerImage: UIImageView!
    @IBOutlet weak var dName: UILabel!
    @IBOutlet weak var dPosition: UILabel!
    
    func updateCell(name: Name){
        self.developerImage.image = name.image
        self.dPosition.text = name.position
        self.dName.text = name.name1
        
        
    }
}
