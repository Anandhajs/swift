//
//  developerViewController.swift
//  tableView
//
//  Created by Keerthi on 18/02/22.
//

import UIKit

class developerViewController: UIViewController {

    @IBOutlet weak var developerImage: UIImageView!
    
    @IBOutlet weak var position: UILabel!
    
    @IBOutlet weak var Description: UITextView!
    
    var player: Name?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        developerImage.image = player?.image
        position.text = player?.position
        Description.text = player?.description
        
        self.title = player?.name1
        
    }
    

    

}
