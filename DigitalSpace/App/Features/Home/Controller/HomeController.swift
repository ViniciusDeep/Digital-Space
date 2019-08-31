//
//  ViewController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    var categoryViewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Digital Space"
        setupTableView()
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        categoryViewModel.fetchCategories { (categories) in
            
            self.categoryViewModel.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

