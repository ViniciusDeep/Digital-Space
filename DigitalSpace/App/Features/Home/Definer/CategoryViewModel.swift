//
//  CategoryViewModel.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    
    var categories = [Category]()
    
    mutating func fetchCategories(completion: @escaping ([Category]) -> ()) {
        var this = self
        Repository.getAllCategories { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let categories):
                this.categories = categories
                completion(categories)
            }
        }
    }
}
