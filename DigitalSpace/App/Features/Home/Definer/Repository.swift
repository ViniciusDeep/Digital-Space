//
//  Repository.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

enum Router {
    static var baseUrl: String {
        return "https://cdn.joyjet.com/tech-interview/mobile-test-one.json"
    }
}

struct Repository {
    static func getAllCategories(completion: @escaping (Result<[Category], Error>) -> ()){
        Service<[Category]>().get(url: Router.baseUrl) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                return
            case .success(let categories):
                completion(.success(categories))
            }
        }
    }
}
