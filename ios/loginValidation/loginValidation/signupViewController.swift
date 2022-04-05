//
//  signupViewController.swift
//  loginValidation
//
//  Created by Keerthi on 18/03/22.
//

import UIKit
import CoreData

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
   
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    let alertview = UIAlertController(title: "Error", message: "Some Error Occured", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        context = delegate.persistentContainer.viewContext
        
        let closeAction = UIAlertAction(title: "close", style: .default) {
            (action) in
            self.alertview.dismiss(animated: true, completion: nil)
        }
        
        alertview.addAction(closeAction)
       
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        
        do {
            try save(uname: userName.text!, lname: lastName.text!, fname: firstName.text!, pass: passwordField.text!, cpass: confirmField.text!)
        } catch {
            let errorMessage = error as? signupError
            alertview.message = errorMessage?.localizedDescription
            self.present(alertview, animated: true, completion: nil)
        }
    }
    
    func save(uname: String, lname: String, fname: String, pass: String, cpass: String) throws {
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Registration", into : context!)

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

                person.setValue(uname, forKey: "uname")
                person.setValue(pass, forKey: "pass")
                person.setValue(cpass, forKey: "cpass")
                person.setValue(fname, forKey: "fname")
                person.setValue(lname, forKey: "lname")
                
                do{
                    try context?.save()
                    print("Success...")
                    print("username = ",uname)
                    print("Password = ",pass)
                    self.goToSuccess()
                }catch{
                    print("Error...")
                }
                //print("True...")
            }
        
    func goToSuccess(){
    
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "signViewControllerID")
            vc.view.backgroundColor = .systemGreen
    
            self.navigationController?.pushViewController(vc, animated: true)
    }
        
}
    
