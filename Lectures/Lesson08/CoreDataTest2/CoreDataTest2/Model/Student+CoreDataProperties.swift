//
//  Student+CoreDataProperties.swift
//  CoreDataTest2
//
//  Created by Håkon Bogen on 28/10/2020,44.
//  Copyright © 2020 beining & bogen. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var school: School?

}
