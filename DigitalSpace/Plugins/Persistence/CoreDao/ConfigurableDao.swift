//
//  ConfigurableDao.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 02/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//


import Foundation

protocol ConfigurableDao {
    associatedtype Object
    func insert(object: Object)
    func delete(object: Object)
    func fetchAll() -> [Object]
}
