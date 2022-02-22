//
//  ViewController.swift
//  stackView
//
//  Created by Keerthi on 21/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        stack()
        
    
    }

    func stack() {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(systemName: "book.fill")
        imageView.contentMode = .scaleAspectFit
        
        let label = UILabel()
        label.text = " Hello Swift"
        label.textAlignment = .center
        label.backgroundColor = .green
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        let label1 = UILabel()
        label1.text = " Hello world"
        label1.textAlignment = .center
        label1.backgroundColor = .systemBlue
        
        label1.font = .systemFont(ofSize: 20, weight: .bold)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label, label1])
        stackView.backgroundColor = .white
        
        stackView.frame = view.bounds
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
    }
    
    
    
    

}

