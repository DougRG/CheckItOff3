//
//  Items+CoreDataProperties.swift
//  CheckItOff3
//
//  Created by Douglas Goodwin on 6/3/16.
//  Copyright © 2016 Dr.G. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Items {

    @NSManaged var listItem: String?
    @NSManaged var completeBy: NSDate?
    @NSManaged var done: NSNumber?

}
