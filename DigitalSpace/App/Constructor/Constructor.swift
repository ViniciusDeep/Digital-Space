//
//  Constructor.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableConstructor {
    mutating func setupConstructor()
}

struct Constructor: ConfigurableConstructor {
    var window: UIWindow?
    
    init() {
        setupConstructor()
    }
    
    mutating func setupConstructor() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ContainerController()
        window?.makeKeyAndVisible()
    }
}


