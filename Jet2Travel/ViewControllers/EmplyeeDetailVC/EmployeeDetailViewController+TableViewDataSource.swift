//
//  EmployeeDetailViewController+TableViewDataSource.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 01/03/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation
import UIKit

extension EmployeeDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let employeeDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "employeeDetailTableViewCell", for: indexPath) as? EmployeeDetailTableViewCell else {
            fatalError("Failed to initialize the EmployeeDetailTableViewCell ")
        }
        
        switch indexPath.row {
        case 0: // Name
            employeeDetailTableViewCell.textLabel?.text = "Name"
            employeeDetailTableViewCell.detailTextLabel?.text = employee.name
            
        case 1: // Age
            employeeDetailTableViewCell.textLabel?.text = "Age"
            employeeDetailTableViewCell.detailTextLabel?.text = employee.age
            
        case 2:  // Salary
            employeeDetailTableViewCell.textLabel?.text = "Salary"
            employeeDetailTableViewCell.detailTextLabel?.text = employee.salary
            
        default:
            break
        }
        
        return employeeDetailTableViewCell
    }
    

    
    
}
