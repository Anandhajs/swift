//
//  ViewController.swift
//  image
//
//  Created by Keerthi on 24/02/22.
//
import  AVKit
import AVFoundation
import UIKit









class ViewController: UIViewController {
   // let label = UILabel()
    private let myview: UIView = {
        let Myview = UIView()
        Myview.translatesAutoresizingMaskIntoConstraints = true
        return Myview
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let image = UIImageView(frame: UIScreen.main.bounds)
//        image.image = UIImage(named: "Image")
//        image.contentMode = .scaleAspectFit
//        view.insertSubview(image, at: 0)
        
        view.addSubview(myview)
        addconstraints()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "train", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        //player.volume = 0
        player.play()
//        label.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
//        label.text = "hello"
//        label.textAlignment = .center
//        label.textAlignment = NSTextAlignment.justified
//        label.textColor = .systemRed
//        label.center = view.center
//        view.addSubview(label)
//
    }
    
    private func addconstraints(){
       
        var constraint = [NSLayoutConstraint]()
        constraint.append(myview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraint.append(myview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraint.append(myview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraint.append(myview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))

        NSLayoutConstraint.activate(constraint)
    }
    
    
}

