//
//  ItemViewCell.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ItemViewDelegate: class {
    func didToItem()
}


class ItemViewCell: UICollectionViewCell, ConfigurableView {
  
    let imageBanner: UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
    }()
    
    let titleItem: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "INTERNATIONAL SPACE STATION"
        label.textColor = .white
        return label
    }()
    
    
    let descriptionItem: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    lazy var previousItem: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow_left"), for: .normal)
        button.addTarget(self, action: #selector(didToItem), for: .touchUpInside)
        return button
    }()
    
    lazy var nextItem: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow_right"), for: .normal)
        button.addTarget(self, action: #selector(didToItem), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: ItemViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageBanner, titleItem, descriptionItem, previousItem, nextItem])
    }
    
    func setupConstraints() {
        imageBanner.cBuild(make: .fillSuperview)
        
        titleItem.cBuilder {
            $0.top.equal(to: imageBanner.topAnchor, offsetBy: self.frame.height / 2 + 40)
            $0.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
        
        descriptionItem.cBuilder {
            $0.top.equal(to: titleItem.bottomAnchor, offsetBy: 10)
            $0.leading.equal(to: leadingAnchor, offsetBy: 10)
            $0.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        previousItem.cBuild(make: .centerYInSuperView)
        
        previousItem.cBuilder {
            $0.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
        
        
        nextItem.cBuild(make: .centerYInSuperView)
        
        nextItem.cBuilder {
            $0.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
    }
}

extension ItemViewCell {
    @objc func didToItem() {
        delegate?.didToItem()
    }
}
