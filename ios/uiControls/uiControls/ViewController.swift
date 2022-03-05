//
//  ViewController.swift
//  uiControls
//
//  Created by Keerthi on 05/03/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let frame1 = CGRect(x: 40, y: 400, width: 300, height: 70)
        let uiView = UIView(frame: frame1)
        uiView.backgroundColor = .systemPink
        self.view.addSubview(uiView)
        
        
        let label = UILabel.init()
        label.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        label.text = "Swift"
        label.textAlignment = .center
        label.backgroundColor = .systemGreen
        label.textColor = .black
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.black.cgColor
        label.font = .italicSystemFont(ofSize: 25)
        self.view.addSubview(label)
        
        //view.backgroundColor = .white
        let button = UIButton.init(type: .system)
        button.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        button.setTitle("Submit", for: .normal)
        //button.titleLabel?.textColor = .red
        button.tintColor = .black
        button.backgroundColor = .systemYellow
        
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(button)
       

        let textField = UITextField.init()
        textField.attributedPlaceholder = NSAttributedString.init(string: " Enter Your Name")
        textField.frame = CGRect(x: 20, y: 100, width: 300, height: 30)
        self.view.addSubview(textField)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        
        
        let textView = UITextView()
        textView.frame = CGRect(x: 30, y: 500, width: 300, height: 80)
        view.addSubview(textView)
        
        
        let myActivityIndicator = UIActivityIndicatorView()
               
        myActivityIndicator.center = view.center
        myActivityIndicator.style = .large
        myActivityIndicator.startAnimating()
               myActivityIndicator.hidesWhenStopped = true
               
               view.addSubview(myActivityIndicator)
    }
   
    @objc func buttonClicked(_ : UIButton){
        
    }
    
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
}

