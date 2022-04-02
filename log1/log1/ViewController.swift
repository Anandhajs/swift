//
//  ViewController.swift
//  log1
//
//  Created by Keerthi on 17/02/22.
//

import UIKit

enum loginError: Error{
    case invalidEmail
    case invalidPassword
    case noAccount
    
    var localizedDescription: String{
        switch self {
        case .invalidEmail:
            return "Enter valid email"
        case .invalidPassword:
            return "Enter valid password"
        case .noAccount:
            return "Please verify your email and password "
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    let alertView = UIAlertController(title: "Error", message: "Some Error message", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let closeAction = UIAlertAction(title: "close", style: .default) { (action) in
            self.alertView.dismiss(animated: true, completion: nil)
        }
        
        alertView.addAction(closeAction)
        
        if UserDefaults.standard.bool(forKey: "isLogedin"){
            gotoTabBar()
        }
        
    }
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        do {
            try validation()
        }catch{
            
            let loginError = error as? loginError
            
            alertView.message = loginError?.localizedDescription
            self.present(alertView, animated: true, completion: nil)
            
        }
        
    }
    
    func validation() throws {
        
        guard let email = emailField.text, email != "" else {
            throw loginError.invalidEmail
        }
        
        guard let password = passwordField.text, password != "" else {
            throw loginError.invalidPassword
        }
        
        let data = UserDefaults.standard.value(forKey: "vari") as! Data
        
        if let users = try? PropertyListDecoder().decode(Array<Variable>.self, from: data){
            
            let vari1 = Variable(email: email, password: password)
            
            for user in users{
                
                if user == vari1{
                    
                    UserDefaults.standard.setValue(vari1.email, forKey: "LogedInUserEmail")
                    
                    UserDefaults.standard.setValue(true, forKey: "isLogedin")
                    
                    gotoTabBar()
                    break
                }
                
                print(user)
                
                if users.last! == user{
                    throw loginError.noAccount
                }
            }
        }
        
    }
    
    func gotoTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "loginID")
        vc.view.backgroundColor = .systemBlue
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

