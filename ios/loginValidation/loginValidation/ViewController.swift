//
//  ViewController.swift
//  loginValidation
//
//  Created by Keerthi on 18/03/22.
//

import UIKit

enum loginError: Error {
    case invallidUserName
    case invalidPassword
    case noAccount
    
    var localizedDescription: String{
        
        switch self {
        case .invallidUserName:
            return "Please Enter valid UserName"
        case .invalidPassword:
            return "InvalidPassword"
        case .noAccount:
            return "Please verify Your Username and password"
        }
        
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    let alertview = UIAlertController(title: "Error", message: "Some Error Occured", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let closeAction = UIAlertAction(title: "close", style: .default) {
            (action) in
            self.alertview.dismiss(animated: true, completion: nil)
        }
        
        alertview.addAction(closeAction)
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        do {
            try validateCredentials()
        }catch{
            
        let loginerror = error as? loginError
            
            alertview.message = loginerror?.localizedDescription
            self.present(alertview, animated: true, completion: nil)
            
        }
    }
    
        func validateCredentials() throws {
        
        guard let email = emailField.text, email != "" else {
            throw loginError.invallidUserName
        }
        
        guard let password = passwordField.text, password != "" else {
            throw loginError.invalidPassword
        }
           
        let data = UserDefaults.standard.value(forKey: "credentials") as! Data
        
        if let users = try? PropertyListDecoder().decode(Array<Credential>.self, from: data){
            
            let credential = Credential(username: email, password: password)
            
            for user in users{
                
                if user == credential{

                    gotoTabBar()
                   
                    break
                }
               // print(user)
                
                if users.last! == user{
                    throw loginError.noAccount
                }
            }
    
        }
            }
    
    func gotoTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "tabViewControllerID")
        vc.view.backgroundColor = .systemRed
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
    

