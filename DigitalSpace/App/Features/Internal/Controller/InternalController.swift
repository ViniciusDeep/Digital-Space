//
//  InternalController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InternalController: UITableViewController {
    
    var item: Item?
    
    let headerView = InternalHeaderView()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    convenience init(item: Item) {
        self.init(style: .plain)
        self.item = item
    } 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
        
        if contentOffsetY > 0 {
            headerView.animator.fractionComplete = 0
            return
        }
        
        headerView.animator.fractionComplete = abs(contentOffsetY) / 100
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
        headerView.delegate = self
        headerView.title.text = item?.title
        headerView.imageBanner.sd_setImage(with: URL(string: item?.galery[section] ?? ""))
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! InternalViewCell
        cell.documentation.text = item?.description
        return cell
    }
    
    
}

extension InternalController: InternalHeaderViewDelegate {
    func didBackButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func didStarTapped() {
        let coreDao = CoreDao<FavoriteItem>(with: "FavoriteItem")
        
        let itemFavor = coreDao.new()
        itemFavor.about = item?.description
        itemFavor.gallery = item?.galery[0]
        itemFavor.title = self.item?.title
        coreDao.insert(object: itemFavor)
    }
}
