//
//  ViewController.swift
//  loginValidation
//
//  Created by Keerthi on 18/03/22.
//

import UIKit
import CoreData

enum loginError: Error {
    case invallidUserName
    case invalidPassword
    case noAccount
    case emptyField
    case passwordEmpty
    
    var localizedDescription: String{
        
        switch self {
        case .invallidUserName:
            return "Please Enter valid UserName"
        case .invalidPassword:
            return "InvalidPassword"
        case .noAccount:
            return "Please verify Your Username and password"
        case .emptyField:
            return "Please Enter Email"
        case .passwordEmpty:
            return "Please Enter Password"
        }
        
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
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
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        do {
            
            try fetch()
        }catch{
            
        let loginerror = error as? loginError
            
            alertview.message = loginerror?.localizedDescription
            self.present(alertview, animated: true, completion: nil)
            
        }
    }
    
   private func fetch() throws {
        guard let email = emailField.text, email != "" else {
            throw loginError.emptyField
            
        }
        guard let password = passwordField.text, password != "" else {
            throw loginError.passwordEmpty
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Registration")
//        request.returnsObjectsAsFaults = false
  //  let request: NSFetchRequest<Registration> = Registration.fetchRequest()
 //   NSPersistentContainer.viewContext.perform {
        
    
        do{
            let results = try context?.fetch(request)
            
                for result in results as! [NSManagedObject]{
                    
                  if  emailField.text == result.value(forKey: "uname") as? String &&
                        passwordField.text == result.value(forKey: "pass") as? String {
                    gotoTabBar()
                  }else{
                    throw loginError.noAccount
                  }

                }
        }catch{
           print("Error...", error)
        }
    }
   
    func gotoTabBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "logViewControllerID")
        vc.view.backgroundColor = .green
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
    

