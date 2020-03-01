//
//  ViewController+TableViewDelegate.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 01/03/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showDetailsForEmployee(at: indexPath.row)
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: {_,_,_ in
            self.delete(at: indexPath.row)
        })
        
        let swipeActionsConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActionsConfiguration.performsFirstActionWithFullSwipe = false
        return swipeActionsConfiguration
    }
    
    
    
}
