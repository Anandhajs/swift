//
//  signViewController.swift
//  loginValidation
//
//  Created by Keerthi on 16/02/22.
//

import UIKit

struct Credential: Codable {
    var email: String
    var password: String
}

extension Credential: Equatable{
    
}

enum SignupError: Error{
    case invalidEmailId
    case invalidPassword
    case confirmPassword
    case passwordDidNotMatched
    case noUser
    
    var localizedDescription: String{
        switch self {
        case .invalidEmailId:
            return " Enter valid email id"
        case .invalidPassword:
            return "Enter valid password"
        case .confirmPassword:
            return "Enter confirm password"
        case .passwordDidNotMatched:
            return "password and confirm password must be same"
        case .noUser:
            return "user not found"
        }
        
    }
}

class signViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    let alertView = UIAlertController(title: "Error", message: "some error message", preferredStyle: .alert)
     
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
        }catch{
            
            let signupError = error as? SignupError
            alertView.message = signupError?.localizedDescription
            self.present(alertView, animated: true, completion: nil)
    }
    }
    func handleSignup() throws {
        guard let email = emailField.text, email != "" else {
            throw SignupError.invalidEmailId
        }
        
        guard let password = passwordField.text, password != "" else {
            throw SignupError.invalidPassword
        }
        
        guard let confirmPassword = confirmPasswordField.text, confirmPassword != "" else {
            throw SignupError.confirmPassword
        }
        
        guard password == confirmPassword else {
            throw SignupError.passwordDidNotMatched
        }
        
       if let data = UserDefaults.standard.value(forKey: "credentials") as? Data,
          let  credentials: [Credential] = try? PropertyListDecoder().decode(Array<Credential>.self, from: data) {
        
        var user = credentials
        user.append(Credential(email: email, password: password))
        
        let encodedData = try? PropertyListEncoder().encode(user)
        
        UserDefaults.standard.setValue(encodedData, forKey: "credentials")
        
        self.dismiss(animated: true, completion: nil)
        
       } else {
        
        let credentials = Credential(email: email, password: password)
        
        let encodedData = try? PropertyListEncoder().encode([credentials])
        
        UserDefaults.standard.setValue(encodedData, forKey: "credentials")
        
        self.dismiss(animated: true, completion: nil)
       }
        
        
        
    }
    
}
    

