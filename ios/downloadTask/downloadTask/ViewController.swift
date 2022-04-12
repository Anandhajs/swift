//
//  ViewController.swift
//  downloadTask
//
//  Created by Keerthi on 07/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressLbl: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // progressView.progress = 0
        
        
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        progressLbl.isHidden = false
        let urlString = "https://tse2.mm.bing.net/th?id=OIP.jLeNRgGsa1dM4Zt8lqu9EgHaFj&pid=Api&P=0&w=216&h=162"
        guard let url = URL(string: urlString)else{
            print("This is invalid url")
            return
            }
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url).resume()
       
}


}
extension ViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else{
            print("error for loading  ")
            return
        }
        
        let image = UIImage(data: data)
        DispatchQueue.main.async { [weak self ] in
            self?.imageView.image = image
            self?.progressLbl.isHidden = true
        }
        
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async { [weak self ] in
            self?.progressView.progress = progress
            self?.progressLbl.text = "\(progress * 100)%"
            print("the value is \(progress) ")
        }
        
        
    }

    
}
