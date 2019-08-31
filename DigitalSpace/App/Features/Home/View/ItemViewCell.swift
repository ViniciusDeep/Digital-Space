//
//  ItemViewCell.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageBanner, titleItem, descriptionItem])
    }
    
    func setupConstraints() {
        imageBanner.cBuild(make: .fillSuperview)
        
        titleItem.cBuilder {
            $0.top.equal(to: imageBanner.topAnchor, offsetBy: self.frame.height / 2 + 30)
        }
        
        descriptionItem.cBuilder {
            $0.top.equal(to: titleItem.bottomAnchor, offsetBy: 10)
        }
        
    }

}
