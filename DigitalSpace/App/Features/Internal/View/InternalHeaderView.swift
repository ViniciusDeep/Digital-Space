//
//  InternalHeaderView.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol InternalHeaderViewDelegate: class {
    func didBackButtonTapped()
    func didStarTapped()
}

class InternalHeaderView: UIView, ConfigurableView {
    
    var animator: UIViewPropertyAnimator!
    
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
    
    lazy var starItem: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_star"), for: .normal)
        button.addTarget(self, action: #selector(didStarTapped), for: .touchUpInside)
        return button
    }()
    
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        button.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    weak var delegate: InternalHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
        
        setupVisualEffectBlur()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.cBuild(make: .fillSuperview)
        })
    }

    
    func buildViewHierarchy() {
        addSubviews([imageBanner, title, descriptionItem, starItem, backButton])
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
        
        starItem.cBuilder { (make) in
            make.top.equal(to: imageBanner.topAnchor, offsetBy: 20)
            make.trailing.equal(to: imageBanner.trailingAnchor, offsetBy: -15)
        }
        
        backButton.cBuilder { (make) in
            make.top.equal(to: starItem.topAnchor)
            make.leading.equal(to: imageBanner.leadingAnchor, offsetBy: 15)
        }
        
    }
    
}

extension InternalHeaderView {
    @objc func didBackButtonTapped() {
        delegate?.didBackButtonTapped()
    }
    @objc func didStarTapped() {
        delegate?.didStarTapped()
    }
}
