//
//  Movie+CoreDataProperties.swift
//  IMDBTestApp
//
//  Created by Håkon Bogen on 25/10/2017,43.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func movieFetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var movieID: String
    @NSManaged public var imdbRating: Double
    @NSManaged public var comment: String?
    @NSManaged public var movieDescription: String?
    @NSManaged public var numberOfTimesSeen: Int32

}
