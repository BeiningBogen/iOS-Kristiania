//
//  Movie.swift
//  CoreDataTest2
//
//  Created by Håkon Bogen on 28/10/2020,44.
//  Copyright © 2020 beining & bogen. All rights reserved.
//

import Foundation

public struct Movie : Decodable, Equatable {
    let name: String
    let actors: [Actor]
    
    
}


public extension Array where Element == Movie {
    func sortFast() -> [Movie] {
        return self.sorted { (movie1, movie2) -> Bool in
            return movie1.name < movie2.name
        }
    }
}


public class Person {
    
    public var name: String
    
    var age: Int = 0
    
    public init(named name: String) {
        self.name = name
    }
}
