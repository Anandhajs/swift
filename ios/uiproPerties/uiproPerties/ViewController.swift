//
//  ViewController.swift
//  uiproPerties
//
//  Created by Keerthi on 28/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var stepperField: UIStepper!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var picker: UIDatePicker!
    let date = DateFormatter()
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Stepper
        
        stepperField.autorepeat = true
       stepperField.isContinuous = true
        labelField.text = stepperField.value.description
        stepperField.minimumValue = 0.0
        stepperField.maximumValue = 20

        // slider
        
        slider.minimumValue = 0.0
        slider.maximumValue = 60
        
        // DatePicker
        
        date.dateFormat = "MM/dd/yyyy"
        textField.inputView = picker
        picker.datePickerMode = .date
        textField.text = date.string(from: picker.date)
        
        // Activity Indicator
        activity.hidesWhenStopped = true
        start.layer.borderColor = UIColor.black.cgColor
        start.layer.cornerRadius = 10
        start.layer.borderWidth = 2
        
        stop.layer.borderColor = UIColor.black.cgColor
        stop.layer.cornerRadius = 10
        stop.layer.borderWidth = 2
        stop.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        labelField.text = sender.value.description
    }
    @IBAction func sliderValueChenged(_ sender: UISlider) {
        let value = round(sender.value)
        sender.value = value
        labelField.text = "Your Age is  "+Int(sender.value).description
    }
    
    @IBAction func pickerValueChenged(_ sender: UIDatePicker) {
        
        textField.text = date.string(from: sender.date)
        view.endEditing(true)
        
    }
    
    
    @IBAction func switckAction(_ sender: UISwitch) {
        if(mySwitch.isOn){
            labelField.text = "Switch is ON"
        }else{
            labelField.text = "Switch is OFF"
        }
        
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        activity.stopAnimating()
    }
    @IBAction func startButton(_ sender: UIButton) {
        
        activity.startAnimating()
    }
    
    
}

