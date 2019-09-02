//
//  ItemFavoriteController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 02/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


import UIKit
import SDWebImage

protocol ItemFavoriteControllerDelegate: class {
    func didSelectedItem(item: Item)
}

class ItemFavoriteController: HorizontalSnappingController {
    
    var items: [FavoriteItem]?
    
    override init() {
        super.init()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: ItemFavoriteControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coreDao = CoreDao<FavoriteItem>(with: "FavoriteItem")
        items = coreDao.fetchAll()
        setupCollectionView()
    }
}

extension ItemFavoriteController: UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.register(FavoriteItemViewCell.self, forCellWithReuseIdentifier: "cellId")
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FavoriteItemViewCell
        cell.delegate = self
        cell.titleItem.text = items?[indexPath.row].title
        cell.descriptionItem.text = items?[indexPath.row].description
        guard let url = URL(string: items?[indexPath.row].gallery ?? "") else {return cell}
        cell.imageBanner.sd_setImage(with: url)
        return cell
    }
    
}

extension ItemFavoriteController: FavoriteItemViewCellDelegate {
    func didToItem() {
        print("Go to next")
    }
}

extension ItemFavoriteController {
    func didSelectedItem(item: Item) {
        delegate?.didSelectedItem(item: item)
    }
}

