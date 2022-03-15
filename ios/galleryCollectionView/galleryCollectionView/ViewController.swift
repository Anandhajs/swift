//
//  ViewController.swift
//  galleryCollectionView
//
//  Created by Keerthi on 15/03/22.
//

import UIKit

class ViewController: UIViewController,
                      UICollectionViewDelegate,
                      UICollectionViewDataSource
                      {
    
   

    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: (view.frame.width/3)-4, height: (view.frame.width/3)-4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
            
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(customCollectionViewCell.self, forCellWithReuseIdentifier: "customCollectionViewCell")
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell.identifier, for: indexPath) as! customCollectionViewCell
        //cell.contentView.backgroundColor = .systemGreen
        
        cell.configure(label: "car\(indexPath.row)")
        return cell
    }
    
}

