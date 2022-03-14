//
//  ViewController.swift
//  photoGallery
//
//  Created by Keerthi on 14/03/22.
//
import Foundation
import Photos
import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addPhoto)), UIBarButtonItem(image: UIImage(systemName: "camera.fill"), style: .done, target: self, action: #selector(cameraButtonTapped(_:)))]
        
    
    }
    
   @objc func addPhoto(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }

    @IBAction func cameraButtonTapped(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView?.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
        
    }
}

