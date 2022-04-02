//
//  ViewController.swift
//  progressView
//
//  Created by Keerthi on 28/03/22.
//

import UIKit
import ScreenTime

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    let progress1 = Progress(totalUnitCount: 4)
    var ratio: Float? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.isHidden = true
        ratio = 0
        progress.progress = ratio!
        label.isHidden = true
        progress.layer.cornerRadius = 10
        submitButton.layer.cornerRadius = 10
        
        
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        if (emailField.text != "" && password.text != "" && confirmPassword.text != "") {
            submitButton.isHidden = true
            label.isHidden = false
            progress.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (timer) in
                guard self.progress.isFocused == false else{
                    timer.invalidate()
                    self.label.text = "Data Saved"
                    return
                }
                self.progress.completedUnitCount += 1
                                let progrsssFloat = Float(self.progress.fractionCompleted)
                                self.progressView.setProgress(progrsssFloat, animated: true)
                                  
               
            }
        }
        
        
    }
    
}

