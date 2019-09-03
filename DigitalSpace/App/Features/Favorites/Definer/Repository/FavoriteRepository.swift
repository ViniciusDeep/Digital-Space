//
//  FavoriteRepository.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


struct FavoritesRepository {
    static func getFavoritesItem() -> [FavoriteItem] {
        let coreDao = CoreDao<FavoriteItem>(with: "FavoriteItem")
        return coreDao.fetchAll()
    }
    
}
