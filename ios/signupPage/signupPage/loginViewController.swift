//
//  loginViewController.swift
//  signupPage
//
//  Created by Keerthi on 17/03/22.
//

import UIKit

enum loginError: Error {
    case invallidUserName
    case invalidPassword
    case noAccount
    
    var localizedDescription: String{
        
        switch self {
        case .invallidUserName:
            return "InvalidUserName"
        case .invalidPassword:
            return "InvalidPassword"
        case .noAccount:
            return "Please verify Your Username and password"
        }
        
    }
    
}


class loginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
    @IBAction func loginButtonTapped(_ sender: UIButton){
        
        let data = UserDefaults.standard.value(forKey: "credentials") as? Data
        
        let users = try? PropertyListDecoder().decode(Array<Credential>.self, from: data!)
        
        
    }
    
    func gotoTabBar() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "loginViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
