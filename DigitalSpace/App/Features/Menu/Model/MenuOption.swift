//
//  MenuOption.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 01/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    
    case Home
    case Favorites
    
    var description: String {
        switch self {
        case .Home: return "Home"
        case .Favorites: return "Favorites"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Home: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Favorites: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        }
    }
}

