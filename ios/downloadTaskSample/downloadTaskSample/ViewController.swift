//
//  ViewController.swift
//  downloadTaskSample
//
//  Created by Keerthi on 08/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0
        
    }


    @IBAction func buttonClicked(_ sender: UIButton) {
        
     let urlString = "https://www.keralatourism.org/images/downloadHRI/resorts/big/1.jpg"
     
        guard let url = URL(string: urlString) else {
            print("This is invalid url")
            return
        }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.downloadTask(with: url).resume()
        
    }
}
extension ViewController: URLSessionDownloadDelegate{
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("We want show the image")
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        progressView.progress = progress
        progressLbl.text = " \(progress * 100) %"
        
    }
    
}
