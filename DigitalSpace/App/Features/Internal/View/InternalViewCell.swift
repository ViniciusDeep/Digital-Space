//
//  InternalViewCell.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 31/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class InternalViewCell: UITableViewCell, ConfigurableView {
    
    let documentation: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Specific", attributes: [.foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: " Your goal should be clear and specific, otherwise you won't be able to focus your efforts or feel truly motivated to achieve it. When drafting your goal, try to answer the five W questions:", attributes: [.foregroundColor: UIColor.gray]))
        
        attributedText.append(NSAttributedString(string: "\n\n\nExample:", attributes: [.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\nImagine that you are currently a marketing executive, and you'd like to become head of marketing. A specific goal could be, I want to gain the skills and experience necessary to become head of marketing within my organization, so that I can build my career and lead a successful team.", attributes: [.foregroundColor: UIColor.gray]))
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([documentation])
    }
    
    func setupConstraints() {
        documentation.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor)
        }
    }
}
