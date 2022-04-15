//
//  ViewController.swift
//  alertControl
//
//  Created by Keerthi on 15/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        
       // actionSheet()
       // showAlert()
        showAlertWithTextField()
        
    }
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Hello", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Error", style: .cancel, handler: {action  in
           print("Button Clicked...")
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action  in
            
        }))
        
        present(alert, animated: true)
    }
    
    func actionSheet() {
        
        let action = UIAlertController(title: "Alert", message: "Hello", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _  in
           print("Button Clicked...")
        }))
        
        action.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action  in
            
        }))
        
        present(action, animated: true)
    }

    func showAlertWithTextField() {
        let alertControl = UIAlertController(title: "Add Tag", message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Add", style: .default, handler: {_  in
            if let textField = alertControl.textFields?.first, let text = textField.text {
                print("Text ==> " + text)
                
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
                alertControl.addTextField { (textField) in
                    textField.placeholder = "Tag"
                }
        alertControl.addAction(confirm)
        alertControl.addAction(cancelAction)
        present(alertControl, animated: true, completion: nil)
        
        }
    
    
}

