//
//  ViewController.swift
//  loadTable
//
//  Created by Keerthi on 12/04/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

struct Actor: Codable{
    
    let localized_name: String
    let img: String
}


class ViewController: UIViewController, UITableViewDataSource {
   
    
    var actors = [Actor]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                self.actors = try JSONDecoder().decode([Actor].self, from: data!)
                }catch{
                    print("Parse Error...", error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                }
        }.resume()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customTableViewCell
        cell.imageLbl.text = actors[indexPath.row].localized_name.capitalized
        
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + actors[indexPath.row].img
        cell.imageView1.downloaded(from: completeLink)
        cell.imageView1.clipsToBounds = true
        cell.imageView1.layer.cornerRadius = cell.imageView1.frame.height / 2
        cell.imageView1.contentMode = .scaleToFill
        return cell
    }
    
}

