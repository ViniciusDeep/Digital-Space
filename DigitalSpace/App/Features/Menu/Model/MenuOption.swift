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
}

