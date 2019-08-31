//
//  InternalHeaderView.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InternalHeaderView: UIView, ConfigurableView {
    
    let imageBanner: UIImageView = {
        let image = UIImageView(image: UIImage(named: "placeholder"))
        return image
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "MY CAPSULE"
        label.font = UIFont(name: "Arial", size: 32)
        label.textColor = .lightGray
        return label
    }()
    
    let descriptionItem: UILabel = {
        let label = UILabel()
        label.text = "my life"
        label.textColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageBanner, title, descriptionItem])
    }
    
    func setupConstraints() {
        imageBanner.cBuilder { (make) in
            make.top.equal(to: topAnchor)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
            make.height.equal(to: heightAnchor, offsetBy: -50)
        }
        
        title.cBuilder { (make) in
            make.top.equal(to: imageBanner.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
        
        descriptionItem.cBuilder { (make) in
            make.top.equal(to: title.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: title.leadingAnchor)
        }
        
    }
    
}
