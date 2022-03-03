//
//  ViewController.swift
//  splitView
//
//  Created by Keerthi on 23/02/22.
//

import UIKit

class ViewController: UIViewController, UISplitViewControllerDelegate {
    
    let splitVC = UISplitViewController(style: .doubleColumn)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitVC.delegate = self
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Enter", for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    
    
    @objc private func didTapButton(){
        let menuVC = menuController(style: .plain)
        menuVC.delegate = self
        let secondVC = UIViewController()
        secondVC.title = "Home"
        secondVC.view.backgroundColor = .systemIndigo
        splitVC.viewControllers = [UINavigationController(rootViewController: menuVC),
        UINavigationController(rootViewController: secondVC)]
        
        
        present(splitVC, animated: true)
    
    }
}

extension ViewController: menuControllerDelegate{
    func didTapMenuItem(at index: Int, title: String) {
        (splitVC.viewControllers.last as? UINavigationController)?.popViewController(animated: false)
        
        let vc = UIViewController()
        vc.view.backgroundColor = .systemRed
        vc.title = title
        (splitVC.viewControllers.last as? UINavigationController)?.pushViewController(vc, animated: true)
        
    }
    
    
}

protocol menuControllerDelegate: AnyObject {
    func didTapMenuItem(at index: Int, title: String)
}
 
class menuController: UITableViewController {
    
    weak var delegate: menuControllerDelegate?
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        title = "Menue"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Option\(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellLable = tableView.cellForRow(at: indexPath)?.textLabel?.text
        delegate?.didTapMenuItem(at: indexPath.row, title: cellLable!)
    }
    
    
}


