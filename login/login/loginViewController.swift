//
//  loginViewController.swift
//  login
//
//  Created by Keerthi on 15/02/22.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func loginButtonTapAction(_ sender: UIButton) {
        
        print(emailField.text)
        print(passwordField.text)
        print("button touched")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "welcomeView")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        //self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
