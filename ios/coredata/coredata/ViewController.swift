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
    
    @IBAction func updateButton(_ sender: UIButton) {
        guard let name = nameField.text, name != "" else {
            print("Name is Empty..")
            return  }
        guard let age = ageField.text, age != "" else {
            print("Age Field is Empty...")
            
        return
            
        }
        
        update(name: name, updateAge: age)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
       
        guard let name = nameField.text, name != "" else {
            print("Name is Empty..")
            return  }
        
        delete(name: name)
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
        
    }
    func fetch(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "Person1")
        
       
        do{
            let results = try context?.fetch(request)
            let count = results?.count
            if 0 < count! {
                for result in results as! [NSManagedObject]{
                    let name = result.value(forKey: "name") as? String
                    let age = result.value(forKey: "age") as? String
                        print("Name..= \(name)  Your Age is =  \(age)")
                    
                }
            }
        }catch{
            print("Error...", error)
        }
    }
    func update(name: String, updateAge: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person1")
        let predicate = NSPredicate(format: "name= %@",name)
        request.predicate = predicate
        
        do{
            self.fetch()
            let test = try context?.fetch(request)
            if test?.count == 1 {
                let update = test![0] as! NSManagedObject
                update.setValue(updateAge, forKey: "age")
                
                
                do{
                    try context?.save()
                    print("Update Success...")
                    self.fetch()
                }catch{
                    print("Error...",error.localizedDescription)
                }
            }
            
        }catch{
            print("Error...", error.localizedDescription)
        }
    }
   
    func delete(name: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName : "Person1")
        let predicate = NSPredicate(format: "name=  \(name)")
        request.predicate = predicate
        
        do{
            self.fetch()
            let test = try context?.fetch(request)
            if test?.count == 1 {
                let delete = test![0] as! NSManagedObject
                context?.delete(delete)
                
                do{
                    try context?.save()
                    print("Delete Success...")
                    self.fetch()
                }catch{
                    print("Error...",error.localizedDescription)
                }
            }
            
        }catch{
            print("Error...", error.localizedDescription)
        }
    }
}

