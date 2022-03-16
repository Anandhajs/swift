//
//  ViewController.swift
//  signupPage
//
//  Created by Keerthi on 16/03/22.
//

import UIKit

enum signupError: Error {
    case invalidFirstName
    case invalidLastName
    case invalidNumber
    case invalidUserName
    case invalidPassword
    case passwordDidNotMatched
    
    var localizedDescription: String{
        switch self {
        case .invalidFirstName:
            return "Please Enter Valid FirstName"
        case .invalidLastName:
            return "Please Enter Valid LastName"
        case .invalidNumber:
            return "Please Enter Valid MobileNumber"
        case .invalidUserName:
            return "Please Enter Valid UserName"
        case .invalidPassword:
            return "Please Enter Valid Password"
        case .passwordDidNotMatched:
            return "Password and confirmPassword Must be Matched"
        }
        
    }
    
    
    }


class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    let alertview = UIAlertController(title: "Error", message: "Some Error Occured", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let closeAction = UIAlertAction(title: "close", style: .default) {
            (action) in
            self.alertview.dismiss(animated: true, completion: nil)
        }
        
        alertview.addAction(closeAction)
       
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        
        do {
            try handleSignup()
        } catch {
            let errorMessage = error as? signupError
            alertview.message = errorMessage?.localizedDescription
            self.present(alertview, animated: true, completion: nil)
        }
        
    
    }
        func handleSignup() throws {
            
            guard let first = firstName.text, first != "" else {
                throw signupError.invalidFirstName
                
            }
            guard let last = lastName.text, last != "" else {
                throw signupError.invalidLastName
                
            }
            guard let number = numberField.text, number != "" else {
                throw signupError.invalidNumber
                
            }
            
            guard let username = userName.text, username != "" else {
                throw signupError.invalidUserName
            
            }
            
            guard let password = passwordField.text, password != "" else {
                throw signupError.invalidPassword
                
            }
            guard let confirm = confirmPassword.text, confirm != "" else {
                throw signupError.invalidPassword
                
            }
            guard password == confirm else {
                throw signupError.passwordDidNotMatched
            }
        }
        
    }
    

