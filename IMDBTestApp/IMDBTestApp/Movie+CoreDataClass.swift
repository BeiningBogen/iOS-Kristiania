//
//  Movie+CoreDataClass.swift
//  IMDBTestApp
//
//  Created by Håkon Bogen on 25/10/2017,43.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Movie)
public class Movie: NSManagedObject {
    
    class func fetchOrInsert(attributes: [String : Any], managedObjectContext: NSManagedObjectContext) -> Movie? {
        
        guard let movieID = attributes["id"] as? String, let imdbRating = attributes["imdbRating"] as? Double else {
            
            return nil
            
        }
        
        let movie: Movie = {
            
            let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
            fetchRequest.predicate = NSPredicate.init(format: "movieID == %@", movieID)
            
            let results = try! managedObjectContext.fetch(fetchRequest)
            if results.count > 0 {
                return results.first!
            } else {
                let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedObjectContext)!
                let movie = Movie(entity: entity, insertInto: managedObjectContext)
                movie.movieID = movieID
                return movie
                
            }
            
        }()
        
        movie.title = attributes["title"] as? String
        movie.imdbRating = imdbRating
        movie.movieDescription = attributes["description"] as? String
        
        
        return movie
        
    }
    
    
}
