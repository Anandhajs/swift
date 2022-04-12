//
//  ViewController.swift
//  dataTask1
//
//  Created by Keerthi on 07/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else
    {
        return

    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let dataResponse = data,
          error == nil else {

              print(error?.localizedDescription ?? "Response Error")
              return

    }
        do{
            
            let jsonResponse = try JSONSerialization.jsonObject(with:
                                   dataResponse, options: [])
            print(jsonResponse)
         } catch{
            print("Error", error.localizedDescription)
       }
        
    }
        task.resume()

}
}
