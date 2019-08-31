//
//  Home+TableViewController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_menu"), landscapeImagePhone: UIImage(named: "ic_menu"), style: .done, target: self, action: #selector(didReceiveMenu))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial", size: 20)!]
    }
    
    
    func setupTableView() {
        tableView.register(CategoryViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CategoryViewCell
        cell.collectionViewController.delegate = self
    //cell.items = categoryViewModel.categories[indexPath.section].items
        cell.textLabel?.text = categoryViewModel.categories[indexPath.section].items[indexPath.row].title
        return cell
    }
}

extension HomeController: ItemControllerDelegate {
    func didSelectedItem() {
        navigationController?.pushViewController(InternalController(), animated: true)
    }
}



