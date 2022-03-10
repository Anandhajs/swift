//
//  ViewController.swift
//  tapBar
//
//  Created by Keerthi on 10/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "Bar Items"
        view.backgroundColor = .systemBlue
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemPurple
        button.setTitle("Go To Next View", for: .normal)
    
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        tabBarItem1()
    }

    func tabBarItem1(){
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem( barButtonSystemItem: .add, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: nil)
            ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil)
        
    }
     
    @objc func buttonTapped(){
        let vc = UIViewController()
        vc.view.backgroundColor = .systemGreen
        vc .title = "View 2"
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign up", style: .done, target: self, action: nil)
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

