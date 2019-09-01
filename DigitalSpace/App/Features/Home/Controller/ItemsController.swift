//
//  BaseCollectionController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


protocol ItemControllerDelegate: class {
    func didSelectedItem()
}

class ItemsController: HorizontalSnappingController {
   
    var items = [Item]()
    
    convenience init(items: [Item]) {
        self.init()
        self.items = items
        print(items)
    }
    
    weak var delegate: ItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
}

extension ItemsController: UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        collectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: "cellId")
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectedItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ItemViewCell
        cell.delegate = self
        return cell
    }
    
}

extension ItemsController: ItemViewDelegate {
    func didToItem() {
        print("Go to next")
        
        
        
    }
}

extension ItemsController {
    @objc func didSelectedItem() {
        delegate?.didSelectedItem()
    }
}
