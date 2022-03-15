//
//  ViewController.swift
//  tableView
//
//  Created by Keerthi on 08/03/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let sections: [String] = ["Electronics","cars","sports"]
    
    let rows: [[String]] = [
        ["Grainder","TV","Laptops","AC"],
        ["Audi","Honda","Ferrari"],
        ["Cricket","FootBall","Chess","Long Jump"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}



extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell") as! myTableViewCell
        let title = rows[indexPath.section][indexPath.row]
        cell.cellLabel.text = title
        cell.cellImage.image = UIImage(named: "grinder")
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}
   
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You Selected: \(rows[indexPath.section][indexPath.row])")
    }
}


class myTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
}
    

