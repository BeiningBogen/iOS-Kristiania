//
//  IMDBTestAppTests.swift
//  IMDBTestAppTests
//
//  Created by Håkon Bogen on 25/10/2017,43.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import XCTest
import CoreData
@testable import IMDBTestApp

class IMDBTestAppTests: XCTestCase {
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
        return managedObjectModel
    }()
    
    lazy var mockPersistantContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "IMDBTestApp", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    
    override func setUp() {
        super.setUp()
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSerializeMovie() {
        let json = """
{
"title": "Star Wars",
"id": "1",
"imdbRating": 7.8
}
"""

        let jsonSerialization
        let entity =  NSEntityDescription.entity(forEntityName: "Movie", in: mockPersistantContainer.viewContext)!
        let movie = Movie.fetchOrInsert(attributes: json, managedObjectContext: mockPersistantContainer.vi)
            
        XCTAssertNotNil(movie)
        

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
