//
//  CategoryHeaderView.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CategoryHeaderView: UIView, ConfigurableView {
  
    
    lazy var titleHeader: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([titleHeader])
    }
    
    func setupConstraints() {
        titleHeader.cBuilder {
            $0.top.equal(to: topAnchor, offsetBy: 5)
            $0.leading.equal(to: leadingAnchor, offsetBy: 10)
        }
    }
}
