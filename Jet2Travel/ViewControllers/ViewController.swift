//
//  ViewController.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 28/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
       
        networkManager.getEmployeeList { (employees, error) in
            
            guard let _ = employees else {
                print(NetworkResponse.noData.self)
                return
            }
        }
    }
    
    private func setupNavigationBar() {
        let sortBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "SortBarButtonIcon"), style: .plain, target: self, action: #selector(sortOptions))
        self.navigationItem.rightBarButtonItem = sortBarButtonItem
    }

    
    @objc func sortOptions() {
        let actionSheet = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        let byNameAction = UIAlertAction(title: "Name", style: .default) { (_) in
            
        }
        
        let byAgeAction = UIAlertAction(title: "Age", style: .default) { (_) in
            
        }
        
        actionSheet.addAction(byNameAction)
        actionSheet.addAction(byAgeAction)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }

}

