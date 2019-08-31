//
//  Service.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


struct Service<T: Decodable> {
    func get(url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {return print("Does not parse String to URL")}
        
        let session = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return print("Does not load data") }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {completion(.success(result))}
            } catch {
                print("Error in decode class: with error: \(error)")
                DispatchQueue.main.async {completion(.failure(error))}
            }
        }
        DispatchQueue.global(qos: .background).async {session.resume()}
    }
}
