//
//  InternalController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InternalController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
}

extension InternalController {
    
    func setupView() {
        tableView.register(InternalViewCell.self, forCellReuseIdentifier: "cellId")
        navigationController?.navigationBar.isHidden = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = InternalHeaderView()
        headerView.delegate = self
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    
}

extension InternalController: InternalHeaderViewDelegate {
    func didBackButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didStarTapped() {
        //Action Here
    }
}
