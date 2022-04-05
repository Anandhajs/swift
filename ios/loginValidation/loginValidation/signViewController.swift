//
//  signViewController.swift
//  loginValidation
//
//  Created by Keerthi on 24/03/22.
//

import UIKit

class signViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func buttunTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        _ = storyboard.instantiateViewController(identifier: "viewControllerID")
        navigationController?.popViewController(animated: true)
        
    }
    
}
