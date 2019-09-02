//
//  FavoritesViewCell.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 01/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FavoritesViewCell: UITableViewCell, ConfigurableView {
    
    var items: [FavoriteItem]! {
        didSet {
            collectionViewController = ItemFavoriteController()
            buildViewHierarchy()
            setupConstraints()
        }
    }
    
    var collectionViewController: ItemFavoriteController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([collectionViewController!.view])
    }
    
    func setupConstraints() {
        collectionViewController!.view.cBuild(make: .fillSuperview)
    }
}


