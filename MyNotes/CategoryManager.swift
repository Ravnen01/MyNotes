//
//  CategoryManager.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class CategoryManager: NSObject {
    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext: NSManagedObjectContext{
        
        return appDelegate.managedObjectContext
    }
    
    
    func fetchCategory() -> [Category]?{
        let fetchRequest=NSFetchRequest(entityName: "Category")
        let sortCategory = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors=[sortCategory]
        
        do{
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Category]
            return result
        }catch let error as NSError{
            print("Could not fetch Categories : \(error)")
        }
        
        return [Category]()
    }
    
    func createCategory(name: String)->Category?{
        let entity = NSEntityDescription.entityForName("Category", inManagedObjectContext: managedObjectContext)
        let category = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext) as! Category
        category.name=name
        return category
    }

}
