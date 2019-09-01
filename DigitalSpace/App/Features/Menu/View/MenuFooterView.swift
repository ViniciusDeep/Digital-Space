//
//  MenuFooterView.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 01/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuFooterView: UIView, ConfigurableView {
    
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    
    let bannerDigitalSpace: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_joyjet"))
        image.contentMode = UIView.ContentMode.scaleAspectFit
        return image
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
        addSubviews([bannerDigitalSpace, separator])
    }
    
    func setupConstraints() {
        
        separator.cBuilder {
            $0.top.equal(to: topAnchor, offsetBy: 300)
            $0.leading.equal(to: leadingAnchor)
            $0.trailing.equal(to: trailingAnchor)
        }
        
        bannerDigitalSpace.cBuilder {
            $0.top.equal(to: separator.bottomAnchor, offsetBy: 20)
            $0.trailing.equal(to: trailingAnchor)
        }
        
        bannerDigitalSpace.widthAnchor.constraint(equalToConstant: 300).isActive = true
        bannerDigitalSpace.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
