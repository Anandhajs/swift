//
//  CollectionViewController.swift
//  container
//
//  Created by Keerthi on 19/02/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class Cell: UICollectionViewCell{
    @IBOutlet weak var movieImage: UIImageView!

    @IBOutlet weak var imagecell: Cell!
}
class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

}
