//
//  ViewController.swift
//  loginValidation
//
//  Created by Keerthi on 16/02/22.
//

import UIKit
enum loginError: Error{
    case invalidEmail
    case invalidPassword
    case noAccount
    var localizedDescription: String{
        switch self {
        case .invalidEmail:
            return " invalid email id"
        case .invalidPassword:
            return "invalid password"
        case .noAccount:
            return "please verify your email and password"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let alertView = UIAlertController(title: "Error", message: "some error message", preferredStyle: .alert)
     
    override func viewDidLoad() {
        super.viewDidLoad()

        let closeAction = UIAlertAction(title: "close", style: .default) { (action) in
            self.alertView.dismiss(animated: true, completion: nil)
        }
            
        alertView.addAction(closeAction)
        
        if UserDefaults.standard.bool(forKey: "isLogedIn"){
            gotoTabBarView()
        }
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        do {
            try validateCredential()
        }catch{
            let loginError = error as? loginError
            alertView.message = loginError?.localizedDescription
            self.present(alertView, animated: true, completion: nil)
        }
    }
    func validateCredential() throws {
        guard let email = emailField.text, email != "" else {
            throw loginError.invalidEmail
        }
        guard let password = passwordField.text, password != "" else {
            throw loginError.invalidPassword
        }
    let data = UserDefaults.standard.value(forKey: "credendtials") as? Data
    
        if let users = try? PropertyListDecoder().decode(Array<Credential>.self, from: data! ) {
            let credential = Credential(email: email, password: password)
            
            for user in users{
                if user == credential{
                    
                    UserDefaults.standard.setValue(credential.email, forKey: "LogedInUserEmail")
                    UserDefaults.standard.setValue(true, forKey: "isLogedIn")
                gotoTabBarView()
                break
            }
            print(user)
                if users.last! == user{
                    throw loginError.noAccount
        }
    }
        }
    }
    
        func gotoTabBarView(){
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TabViewControllerID")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        }
    }
    



