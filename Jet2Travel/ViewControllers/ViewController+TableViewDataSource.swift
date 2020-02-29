//
//  ViewController+TableViewDataSource.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 01/03/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeTableViewCell else {
            fatalError("Failed to initialise the EmployeeCell identifier")
        }
        
        if employees.count > 0 {
            let employee = employees[indexPath.row]
            let profileImage = employee.profileImage
            cell.profileImage.image = profileImage.isEmpty ? #imageLiteral(resourceName: "ProfilePicPlaceholder") : #imageLiteral(resourceName: "ProfilePicPlaceholder")
            cell.employeeName.text = employee.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    
}
