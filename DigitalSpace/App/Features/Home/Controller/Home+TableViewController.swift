//
//  Home+TableViewController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.categories[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CategoryHeaderView()
        headerView.titleHeader.text = categoryViewModel.categories[section].category
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categoryViewModel.categories.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = categoryViewModel.categories[indexPath.section].items[indexPath.row].title
        return cell
    }
}
