//
//  DigitalSpaceTests.swift
//  DigitalSpaceTests
//
//  Created by Vinicius Mangueira on 30/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import XCTest
@testable import DigitalSpace

class DigitalSpaceTests: XCTestCase {

    func testRepository() {
        Repository.getAllCategories { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
            case .success(let categories):
                XCTAssertNotNil(categories)
            }
        }
    }
    
    
    func testStubAtViewModel() {
        var categorieVm = CategoryViewModel()
        
        categorieVm.fetchCategories { (categories) in
            XCTAssertNotNil(categories)
            categorieVm.categories = categories
        }
        
       XCTAssertNotNil(categorieVm.categories)
        
    }
    
    let mainView = UIView(frame: UIScreen.main.bounds)
    
    /// Test at subviews
    func testAddSubViews() {
        let stubView = UIView(frame: .zero)
        let scrubView = UIView(frame: .zero)
        
        
        mainView.addSubviews([stubView, scrubView])
        
        let subViews = [stubView, scrubView]
        
        
        let subviews = mainView.subviews.map({$0})
        
        XCTAssertEqual(subViews, subviews)
    }
    
    func testStaticMethodsConstraintsAtView() {
        let scrub = UIView()
        mainView.addSubviews([scrub])
        scrub.cBuild(make: .fillSuperview)
        XCTAssertNotNil(scrub.constraints)
    }
    
    func testStubAtConstructor() {
        var constructor = Constructor()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        constructor.setupConstructor()
        XCTAssertEqual(constructor.window?.frame, appDelegate.window?.frame)
    }
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
