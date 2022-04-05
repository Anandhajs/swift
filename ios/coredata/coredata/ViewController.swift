//
//  ViewController.swift
//  CoreData
//
//  Created by Keerthi on 01/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var context: NSManagedObjectContext?
    

        override func viewDidLoad() {
            super.viewDidLoad()
            context = delegate.persistentContainer.viewContext
            
            ageField.keyboardType = .numberPad
            nameField.keyboardType = .alphabet
        }

    @IBAction func buttonClicked(_ sender: UIButton) {
        
        guard let name = nameField.text, name != "" else {
            print("Empty..")
            return
            
        }
        guard let age = ageField.text, age != "" else {
            print("Age is Empty..")
            return
            
        }
        self.save(name: name, age: age)
        
    }
    func save(name: String, age: String){
        
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person1", into : context!)
        
        person.setValue(name, forKey: "name")
        person.setValue(age, forKey: "age")
        
        do{
            try context?.save()
            print("Success...")
            self.fetch()
        }catch{
            print("Error...")
        }
        //print("True...")
    }
    func fetch(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person1")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context?.fetch(request)
            let count = results?.count
            if 0 < count! {
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name"),let age = result.value(forKey: "age") as? String{
                        print("Name..= ",name,"Your Age is = ",age)
                    }
                }
            }
        }catch{
            
        }
    }

   
    
}

