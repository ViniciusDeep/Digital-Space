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
        setupNavigation()
        bindViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    fileprivate func bindViewModel() {
        categoryViewModel.fetchCategories { (categories) in
            self.categoryViewModel.categories = categories
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func didReceiveMenu() {
        print("Toogle Menu")
    }
}

