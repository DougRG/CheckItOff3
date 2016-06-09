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
    
    static func save(listItem:String, completeBy:NSDate, done:Bool) {
        let managedObject = getManagedObject()
        let item = NSEntityDescription.insertNewObjectForEntityForName("Items", inManagedObjectContext: managedObject) as! Items
        item.done = done
        item.completeBy = completeBy
        item.listItem = listItem
        
        do {
            try managedObject.save()
        }
        catch {
            print("save: Error saving.")
        }
    }
    
    
    
    static func update(listItem: Items) {
        let managedObject = getManagedObject()
        
        do {
            let request = NSFetchRequest(entityName: "Items")
            request.predicate = NSPredicate(format: "listItem=%@ and completeBy=%@", listItem.listItem!, listItem.completeBy!)
            
            let results = try managedObject.executeFetchRequest(request)
            let resultSet = results as! [Items]
            resultSet[0].done = listItem.done
        }
        catch {
            
        }
        
        do{
            try managedObject.save()
        }
        catch {
            print("Error")
        }
    }
    
    
}
