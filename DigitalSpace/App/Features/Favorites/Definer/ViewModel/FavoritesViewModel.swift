//
//  FavoritesViewModel.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


struct FavoritesViewModel {
    
    var favorites = [FavoriteItem]()
    
    mutating func bindFavorites() {
       favorites = FavoritesRepository.getFavoritesItem()
    }
}
