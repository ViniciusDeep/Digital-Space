//
//  CategoryViewCell.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell, ConfigurableView {
    
    
    var items: [Item]! {
        didSet {
            collectionViewController = ItemsController(items: items)
        }
    }
    
    var collectionViewController = ItemsController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([collectionViewController.view])
    }
    
    func setupConstraints() {
        collectionViewController.view.cBuild(make: .fillSuperview)
    }
}

