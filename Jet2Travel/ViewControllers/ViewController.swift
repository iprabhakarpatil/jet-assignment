//
//  ViewController.swift
//  Jet2Travel
//
//  Created by Prabhakar Patil on 28/02/20.
//  Copyright © 2020 prabhakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        view.backgroundColor = .green
        networkManager.getEmployeeList()
    }

}

