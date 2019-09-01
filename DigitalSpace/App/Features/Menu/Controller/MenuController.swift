//
//  MenuController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    
    let sections = ["Home", "Favorite"]
    
    weak var delegate: HomeControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1)
        tableView.separatorStyle = .none
    }
}

extension MenuController {
   
    
    
}
