//
//  ViewController.swift
//  sideMenu
//
//  Created by Keerthi on 13/04/22.
//

import UIKit

struct Names{
    var name: String
    var image: UIImage?
}
let Home = Names(name: "Home", image: UIImage(named: "Home"))

let Setting = Names(name: "Setting", image: UIImage(named: "setting"))

let Phone = Names(name: "Phone", image: UIImage(named: "Phone"))

let Contact = Names(name: "Contact", image: UIImage(named: "contact"))

let Google = Names(name: "Google", image: UIImage(named: "google"))

let Location = Names(name: "Location", image: UIImage(named: "location"))

class ViewController: UIViewController {

    var sideBar: UIView!
    var tableView: UITableView!
    var imageView: UIImageView!
    var label: UILabel!
    var isEnabled: Bool = false
    
    var options: [Names] = [ Setting, Home, Google, Location, Contact, Phone ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuButton = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(menuClicked))
        
        self.navigationItem.leftBarButtonItem = menuButton
        
        sideBar = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        self.view.addSubview(sideBar)
        self.sideBar.addSubview(tableView)
        
        tableView.backgroundColor = .lightGray
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @objc func menuClicked(){
        
        print("Menu Clicked..")
        if isEnabled {
            UIView.animate(withDuration: 0.5 ) { [self] in
                sideBar.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
            
                tableView.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height)
            }
            self.isEnabled = false
            
        }else{
            UIView.animate(withDuration: 0.5 ) { [self] in
            sideBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width / 1.5, height: self.view.bounds.height)
            
            tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width / 1.5, height: self.view.bounds.height)
            }
            self.isEnabled = true
        }
        
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        imageView = UIImageView(frame: CGRect(x: 8, y: 8, width: cell.bounds.height-16, height: cell.bounds.height-16))
        imageView.contentMode = .scaleToFill
        imageView.image = options[indexPath.row].image
        cell.addSubview(imageView)
        
        label = UILabel(frame: CGRect(x: self.imageView.bounds.width+16, y: 8, width: cell.bounds.width-(self.imageView.bounds.width+24), height: cell.bounds.height-16))
        label.text = options[indexPath.row].name
        label.font = UIFont.systemFont(ofSize: 22)
        
        cell.addSubview(label)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
