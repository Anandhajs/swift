//
//  ViewController.swift
//  pageView
//
//  Created by Keerthi on 21/02/22.
//

import UIKit

class ViewController: UIViewController , UIPageViewControllerDataSource , UIPageViewControllerDelegate {
     
    var mycontroller = [UIViewController]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page: [String] = [ "chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 chatpter.1 ",
        "chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 chapter.2 ",
        "chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 chapter.3 " ,
        "chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 chapter.4 "]
        
        
        for text in page{
            let vc = TextViewController(with: text)
            
            mycontroller.append(vc)
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.pageview()
    })
        
        }

    func pageview(){
        
        guard let first = mycontroller.first else{
            return
        }
        
        let vc = UIPageViewController(transitionStyle: .pageCurl,
                                      navigationOrientation: .horizontal,
                                      options: nil)
        
        vc.dataSource = self
        vc.delegate = self
        
        vc.setViewControllers([first], direction: .forward,
                              animated: true,
                              completion: nil)
        
        present(vc, animated: true)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let intex = mycontroller.firstIndex(of: viewController), intex > 0 else {
            return nil
        }
        let before = intex - 1
        return mycontroller[before]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let intex = mycontroller.firstIndex(of: viewController), intex < (mycontroller.count - 1) else {
            return nil
        }
        let after = intex + 1
        return mycontroller[after]
    }
    
    
   
    
}

