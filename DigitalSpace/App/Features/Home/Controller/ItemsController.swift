//
//  BaseCollectionController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import SDWebImage

protocol ItemControllerDelegate: class {
    func didSelectedItem(item: Item)
}

class ItemsController: HorizontalSnappingController {
   
    var items: [Item]?
    
    override init() {
        super.init()
    }
    
    convenience init(items: [Item]) {
        self.init()
        self.items = items
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: ItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
}

extension ItemsController: UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: "cellId")
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.items![indexPath.item]
        didSelectedItem(item: item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ItemViewCell
        cell.delegate = self
        cell.titleItem.text = items?[indexPath.row].title
        cell.descriptionItem.text = items?[indexPath.row].description
        guard let url = URL(string: items?[indexPath.row].galery[indexPath.row] ?? "") else {return cell}
        
        cell.imageBanner.sd_setImage(with: url)
        return cell
    }
    
}

extension ItemsController: ItemViewDelegate {
    func didToItem() {
        print("Go to next")
    }
}

extension ItemsController {
     func didSelectedItem(item: Item) {
        delegate?.didSelectedItem(item: item)
    }
}
