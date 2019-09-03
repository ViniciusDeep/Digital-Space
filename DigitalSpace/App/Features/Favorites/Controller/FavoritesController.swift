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
    
    var favoritesViewModel = FavoritesViewModel()
    
    override init(style: UITableView.Style) {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableView()
        setupNavigation()
        favoritesViewModel.bindFavorites()
    }
}

extension FavoritesController {
    func setupNavigation() {
        navigationItem.title = "Favorites"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow_down"), landscapeImagePhone: UIImage(named: "arrow_down"), style: .done, target: self, action: #selector(didReceiveMenu))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial", size: 20)!]
    }
    
    
    func setupTableView() {
        tableView.register(FavoritesViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesViewModel.favorites.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    @objc func didReceiveMenu() {
        dismiss(animated: true, completion: nil)
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FavoritesViewCell
        cell.items = self.favoritesViewModel.favorites
        return cell
    }

}

