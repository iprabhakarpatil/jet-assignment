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
    var employees: [Employee] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate enum SortOptions {
        case name
        case age
    }
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployeeList()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let sortBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "SortBarButtonIcon"), style: .plain, target: self, action: #selector(sortOptions))
        self.navigationItem.rightBarButtonItem = sortBarButtonItem
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "employeeCell")
        
    }

    private func fetchEmployeeList() {
        
        networkManager.getEmployeeList { (employees, error) in
            
            guard let employees = employees else {
                print(NetworkResponse.noData.self)
                return
            }
            self.employees = employees
        }
    }
    
    @objc fileprivate func sortOptions() {
        let actionSheet = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        let byNameAction = UIAlertAction(title: "Name", style: .default) { (_) in
            self.sort(employees: &self.employees, by: .name)
        }
        
        let byAgeAction = UIAlertAction(title: "Age", style: .default) { (_) in
            self.sort(employees: &self.employees, by: .age)
        }
        
        actionSheet.addAction(byNameAction)
        actionSheet.addAction(byAgeAction)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    fileprivate func sort(employees: inout [Employee], by sortOption: SortOptions) {
        
        switch sortOption {
        case .age:
            employees.sort(by: {$0.age < $1.age})
        case .name:
            employees.sort(by: {$0.name < $1.name})
        }
        print("sorted : \(employees)")
        
    }
    
    func delete(at index: Int) {
        employees.remove(at: index)
    }

}


