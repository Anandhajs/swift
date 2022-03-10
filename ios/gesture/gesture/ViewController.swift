//
//  ViewController.swift
//  gesture
//
//  Created by Keerthi on 10/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(function(_:)))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTouchesRequired = 1
        gestureView.addGestureRecognizer(gesture)
        gestureView.isUserInteractionEnabled = true
        
    }

    
    @objc func function(_ gestures: UITapGestureRecognizer){
        print("Tap Fired")
    }
    

}

