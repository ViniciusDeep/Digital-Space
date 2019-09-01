//
//  FavoritesController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 01/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FavoritesController: UITableViewController {
    
    weak var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableView()
        setupNavigation()
    }
}

extension FavoritesController {
    func setupNavigation() {
        navigationItem.title = "Favorites"
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
        return 250
    }
    
    @objc func didReceiveMenu() {
        dismiss(animated: true, completion: nil)
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CategoryViewCell
        //  cell.items = categoryViewModel.categories[indexPath.section].items
        return cell
    }

}

