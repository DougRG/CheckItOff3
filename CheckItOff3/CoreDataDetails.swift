//
//  CoreDataDetails.swift
//  CheckItOff3
//
//  Created by Douglas Goodwin on 6/2/16.
//  Copyright © 2016 Dr.G. All rights reserved.
//

import UIKit
import CoreData

class CoreDataDetails: NSObject {
    
    static func getManagedObject() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        return appDelegate.managedObjectContext
    }
    
    static func getData(entityName: String, predicate: NSPredicate? = nil) -> [NSManagedObject] {
        var resultsManagedObject: [NSManagedObject] = []
        do {
            let managedObject = getManagedObject()
            let request = NSFetchRequest(entityName: entityName)
            if predicate != nil {
                request.predicate = predicate
            }
            
            let results = try managedObject.executeFetchRequest(request)
            resultsManagedObject = results as! [NSManagedObject]
        }
        catch {
            print("Error retrieving data")
            
        }
        return resultsManagedObject
    }

    static func save(listItem: String, completeBy: NSDate, done: Bool) {
        
    }
    
    static func update(listItem: Items) {
        
    }
    
    
}
