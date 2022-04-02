//
//  signupViewController.swift
//  log1
//
//  Created by Keerthi on 17/02/22.
//

import UIKit
struct Variable: Codable {
    var email: String
    var password: String
}
extension Variable: Equatable{
    
}

enum signupError: Error{
    case invalidEmail
    case invalidPassword
    case PasswordDidNotMatched
    
    var localizedDescription: String{
        switch self {
        case .invalidEmail:
            return "Enter valid Email"
        case .invalidPassword:
            return "Enter valid Password"
        case .PasswordDidNotMatched:
            return "password and confirm password must be same"
        }
    }
}

class signupViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!

    let alertView = UIAlertController(title: "Error", message: "Some Error message", preferredStyle: .alert)
    
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
        }catch {
            let signupError = error as? signupError
            alertView.message = signupError?.localizedDescription
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func handleSignup() throws {
        guard let email = emailField.text, email != "" else {
            throw signupError.invalidEmail
        }
        
        guard let password = passwordField.text, password != "" else {
            throw signupError.invalidPassword
        }
        
        guard let confirmPassword = confirmPasswordField.text, confirmPassword != "" else {
            throw signupError.invalidPassword
        }
        
        guard  password == confirmPassword else {
            throw signupError.PasswordDidNotMatched
        }
        
        if let data = UserDefaults.standard.value(forKey: "vari") as? Data,let vari: [Variable] = try? PropertyListDecoder().decode(Array<Variable>.self, from: data) {
            
            var users = vari
            users.append(Variable(email: email, password: password))
            
            let encodeData = try? PropertyListEncoder().encode(users)
            UserDefaults.standard.set(encodeData, forKey: "vari")
            
            self.dismiss(animated: true, completion: nil)
            
        }else{
            
            let vari1 = Variable(email: email, password: password)
            
            let encodeData = try? PropertyListEncoder().encode([vari1])
            UserDefaults.standard.set(encodeData, forKey: "vari")
            
            self.dismiss(animated: true, completion: nil)
            
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "signupID")
        vc.view.backgroundColor = .systemPink
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
