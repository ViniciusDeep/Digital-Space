//
//  Item.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let title: String
    let description: String
    let galery: [String]
}
