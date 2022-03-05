//
//  ViewController.swift
//  pickerView
//
//  Created by Keerthi on 05/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorField: UITextField!
    @IBOutlet weak var sportsField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    
    let colors = ["Red","Orange","Black","Blue","Brown","Green","Gray","White","Pink","Yellow","Purple"]
    
    let sports = ["Cricket","Football","Swimming","Basket Ball","Athlets"]
    
    let countries = ["India","Australia","Russia","America","France","Nato","SriLanka"]
    
    let colorPicker = UIPickerView()
    let sportsPicker = UIPickerView()
    let countryPicker = UIPickerView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorField.inputView = colorPicker
        sportsField.inputView = sportsPicker
        countryField.inputView = countryPicker
        
        colorField.placeholder = "Select Your Color"
        sportsField.placeholder = "Select Your Sports"
        countryField.placeholder = "Select Your Country"
        
        colorField.minimumFontSize = 20
        sportsField.minimumFontSize = 20
        countryField.minimumFontSize = 20
        
        colorField.layer.borderWidth = 2.0
        sportsField.layer.borderWidth = 2.0
        countryField.layer.borderWidth = 2.0
        
        colorField.textAlignment = .center
        sportsField.textAlignment = .center
        countryField.textAlignment = .center
        
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        sportsPicker.delegate = self
        sportsPicker.dataSource = self
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        
        colorPicker.tag = 1
        sportsPicker.tag = 2
        countryPicker.tag = 3
        
    }

}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return colors.count
        case 2:
            return sports.count
        case 3:
            return countries.count
        default:
           return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return colors[row]
        case 2:
            return sports[row]
        case 3:
            return countries[row]
        default:
            return "Data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            colorField.text = colors[row]
            colorField.resignFirstResponder()
        case 2:
            sportsField.text = sports[row]
            sportsField.resignFirstResponder()
        case 3:
            countryField.text = countries[row]
            countryField.resignFirstResponder()
        default:
            return
    }
    }

}
