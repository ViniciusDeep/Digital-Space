//
//  ViewController.swift
//  DigitalSpace
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Digital Space"
        
        Service<[Category]>().get(url: "https://cdn.joyjet.com/tech-interview/mobile-test-one.json") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let categories):
                print(categories)
            }
        }
        
        // Do any additional setup after loading the view.
    }


}

