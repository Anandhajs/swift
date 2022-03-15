//
//  customCollectionViewCell.swift
//  galleryCollectionView
//
//  Created by Keerthi on 15/03/22.
//

import UIKit



class customCollectionViewCell: UICollectionViewCell {
      
    
    static let identifier = "customCollectionViewCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "audi")
        imageView.contentMode = .center
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
       return imageView
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "car"
        label.textAlignment = .center
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = . systemPink
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-50,
                               width: contentView.frame.size.width-10,
                               height: 50)
        myImageView.frame = CGRect(x: 5,
                               y: 0,
                               width: contentView.frame.size.width-10,
                               height: contentView.frame.size.height-50)
    
    }
    
    public func configure(label: String){
        myLabel.text = label
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
    
}
