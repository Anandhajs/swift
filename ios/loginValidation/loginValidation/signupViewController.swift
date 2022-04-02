//
//  signupViewController.swift
//  loginValidation
//
//  Created by Keerthi on 18/03/22.
//

import UIKit

struct Credential: Codable{
    let username: String
    let password: String
}

extension Credential: Equatable{
    
}

enum signupError: Error {
    case invalidFirstName
    case invalidLastName
    
    case invalidUserName
    case invalidPassword
    case confirmPassword
    
    var localizedDescription: String{
        switch self {
        case .invalidFirstName:
            return "Please Enter Valid FirstName"
        case .invalidLastName:
            return "Please Enter Valid LastName"
        case .invalidUserName:
            return "Please Enter Valid UserName"
        case .invalidPassword:
            return "Please Enter Valid Password"
        case .confirmPassword:
            return "Password and confirmPassword Must be Matched"
        }
        
    }
    
    
    }




class signupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    
    let alertview = UIAlertController(title: "Error", message: "Some Error Occured", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let closeAction = UIAlertAction(title: "close", style: .default) {
            (action) in
            self.alertview.dismiss(animated: true, completion: nil)
        }
        
        alertview.addAction(closeAction)
       
    }
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
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
            
            guard let username = userName.text, username != "" else {
                throw signupError.invalidUserName
            
            }
            
            guard let password = passwordField.text, password != "" else {
                throw signupError.invalidPassword
                
            }
            guard let confirm = confirmField.text, confirm != "" else {
                throw signupError.invalidPassword
                
            }
            guard password == confirm else {
                throw signupError.confirmPassword
            }
            
            if let data = UserDefaults.standard.value(forKey: "credentials") as? Data,
               
               let credentials: [Credential] = try? PropertyListDecoder().decode(Array<Credential>.self, from: data){
                
                var users = credentials
                users.append(Credential(username: username, password: password))
                
                let encodeData = try? PropertyListEncoder().encode(users)
                
                UserDefaults.standard.set(encodeData, forKey: "credentials")
                
                self.dismiss(animated: true, completion: nil)
                
            } else {
                let credential = Credential(username: username, password: password)
                
                let encodeData = try? PropertyListEncoder().encode(credential)
                
                UserDefaults.standard.set(encodeData, forKey: "credentials")
                print(credential)
                self.dismiss(animated: true, completion: nil)
                
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "signViewControllerID")
            VC.view.backgroundColor = .systemGreen
    
            self.navigationController?.pushViewController(VC, animated: true)
        }
    
        
    }
    
