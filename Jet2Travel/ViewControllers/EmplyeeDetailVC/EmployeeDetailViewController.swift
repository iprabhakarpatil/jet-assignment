//
//  EmployeeDetailViewController.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 01/03/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var employee: Employee!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.navigationItem.largeTitleDisplayMode = .never
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 55.0
        tableView.register(UINib(nibName: "EmployeeDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "employeeDetailTableViewCell")
    }
    
    
}
