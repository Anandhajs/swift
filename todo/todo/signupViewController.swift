//
//  signupViewController.swift
//  todo
//
//  Created by Keerthi on 15/02/22.
//

import UIKit
enum signupError: Error{
    case invalidEmail
    case invalidPassword
    case passwordDidNotMatched
    
    var localizedDescription: String{
        switch self {
        case .invalidEmail:
            return "please enter valid email id"
        case .invalidPassword:
            return "please enter valid password"
        case .passwordDidNotMatched:
            return "password and confirm password must be same"
            
        }
    }
    
    
}


class signupViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var conformPasswordField: UITextField!
    let alertView = UIAlertController(title: "Error", message: "some error", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeAction = UIAlertAction(title: "close", style: .default) { (action) in
            self.alertView.dismiss(animated: true, completion: nil)
        }
        alertView.addAction(closeAction)
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        do {
            try handleSignup()
        } catch  {
           let signupError = error as? signupError
            alertView.message = signupError?.localizedDescription
            self.present(alertView, animated: true, completion: nil)
        }
    }
        func handleSignup() throws {
            guard let email = emailField.text, email != " " else {
                throw signupError.invalidEmail
            }
            guard let password = passwordField.text, password != " " else {
                throw signupError.invalidPassword
            }
            guard let confirm = conformPasswordField.text, confirm != " " else {
                throw signupError.invalidPassword
            }
            
            guard  password == confirm else {
                throw signupError.passwordDidNotMatched
            }
            
        }
}
    
        
        
    
    
    

