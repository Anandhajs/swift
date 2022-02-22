//
//  TextViewController.swift
//  pageView
//
//  Created by Anand on 21/02/22.
//

import UIKit

class TextViewController: UIViewController {
    let myText: String
    private let myTextView: UITextView = {
       let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 21)
        textView.textColor = .black
        textView.backgroundColor = .systemBlue
        return textView
        
    }()
    
    init(with text: String){
        self.myText = text
        myTextView.text = self.myText
        
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.myTextView)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextView.frame = view.bounds
    }

    

}
