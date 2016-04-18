//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by JOSEPH KERR on 3/1/16.
//  Copyright © 2016 JOSEPH KERR. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    // MARK: food tracker tests
    
    // Test whether the meal initializer returns when no name given or rating less than zero
    func testMealInitialization() {
        // success case
        let potentialItem = Meal(name:"newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure Cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
        
        let badRating = Meal(name:"bad rating", photo:  nil , rating: -1)
        XCTAssertNil(badRating,"Negative ratings are invalid, be positive")
        
        
    }
    
}
