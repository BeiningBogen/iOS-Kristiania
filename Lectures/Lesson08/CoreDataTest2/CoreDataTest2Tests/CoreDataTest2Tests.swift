//
//  CoreDataTest2Tests.swift
//  CoreDataTest2Tests
//
//  Created by Håkon Bogen on 28/10/2020,44.
//  Copyright © 2020 beining & bogen. All rights reserved.
//

import XCTest
@testable import CoreDataTest2

class CoreDataTest2Tests: XCTestCase {
    
    func testCreatePerson() {
        let person = Person(named: "John Doe")
        XCTAssertNotNil(person)
    }
    
    func testPersonWithName() {
        let person = Person(named: "John Doe")
        XCTAssertEqual(person.name, "John Doe")
    }
    
    func testPersonWithAge() {
        let person = Person(named: "John Doe")
        person.age = 28
        XCTAssertEqual(person.age, 28)
    }
    
    func testUpdatePersonName() {
        var person = Person(named: "John Doe")
        person.name = "Steve Jobs"
        XCTAssertEqual(person.name, "Steve Jobs")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSorting() throws {
        
        let movie = Movie.init(name: "Star wars 1", actors: [Actor.init(name: "r2D2")])
        let movie2 = Movie.init(name: "Star wars 5", actors: [Actor.init(name: "C3-po")])
        
        let array = [movie2, movie]
        
        let wanted = [movie, movie2]
        
        let sortedArray = array.sortFast()
        
        XCTAssertEqual(sortedArray, wanted)

    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }

}
