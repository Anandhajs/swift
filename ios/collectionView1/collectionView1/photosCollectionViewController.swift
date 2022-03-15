//
//  photosCollectionViewController.swift
//  collectionView1
//
//  Created by Keerthi on 15/03/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class photosCollectionViewController: UICollectionViewController {

    
    
    private var photos : [Photo] = [ Photo(image: "ar", name: "Painting"),
                                     Photo(image: "honda", name: "Honda"),
                                     Photo(image: "audi", name: "audi"),
                                     Photo(image: "ferrari", name: "Ferrari"),
                                     Photo(image: "football", name: "FootBall"),
                                     Photo(image: "cricket", name: "Cricket"),
                                     Photo(image: "labtop", name: "Labtop"),
                                     Photo(image: "Tv", name: "Tv"),
                                     Photo(image: "nk", name: "painting"),
                                     Photo(image: "mp", name: "painting"),
                                     Photo(image: "vk", name: "painting"),
                                     Photo(image: "orignal-mango", name: "mango")]
    
    override func viewDidLoad() {
                                     
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add,
                                                            style: .done,
                                                            target: self,
                                                            action: nil)
        view.frame = view.bounds
        view.backgroundColor = .systemGreen
        
        self.collectionView!.register(UICollectionViewCell.self,
        forCellWithReuseIdentifier: reuseIdentifier)
    
    }
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 2
            }


            override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                
                return photos.count
            }

            override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! photosCollectionViewCell
            
                
                let city = photos[indexPath.row]
                cell.contentMode = .scaleAspectFit
                
                cell.imageView.image = UIImage(named: city.image)
                cell.imageLabel.text = city.name
            
                return cell
            }
    
   
    
}
