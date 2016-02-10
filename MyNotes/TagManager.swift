//
//  TagManager.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class TagManager: NSObject {
    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext: NSManagedObjectContext{
        
        return appDelegate.managedObjectContext
    }
    
    
    func fetchTag() -> [Tag]?{
        let fetchRequest=NSFetchRequest(entityName: "Tag")
        let sortTag = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors=[sortTag]
        
        do{
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Tag]
            return result
        }catch let error as NSError{
            print("Could not fetch Tags : \(error)")
        }
        
        return [Tag]()
    }
    
    func createTag(name: String)->Tag?{
        let entity = NSEntityDescription.entityForName("Tag", inManagedObjectContext: managedObjectContext)
        let tag = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext) as! Tag
        tag.name=name
        return tag
    }
    
    func searchTag(search:String?)->[Tag]?{
        return searchTagInNote(search, myNote: nil)
    }
    
    
    func searchTagInNote(search:String?, myNote:Note?)->[Tag]?{
        
            let fetchRequest = NSFetchRequest(entityName: "Tag")
        
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
            fetchRequest.sortDescriptors = [sortDescriptor]
        
            var arrayPredicates = [NSPredicate]()
        
        if let _=search {
        
            let predicateSearch = NSPredicate(format: "name contains %@", search!)
            
            arrayPredicates.append(predicateSearch)
            
        }
        
        if let _ = myNote {
            
            let predicateNote = NSPredicate(format: "%@ IN notes", myNote!)
            
            arrayPredicates.append(predicateNote)
        }
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: arrayPredicates)
        
        fetchRequest.predicate=predicate
        
            do{
                let result = try managedObjectContext.executeFetchRequest(fetchRequest) as![Tag]
                return result
            } catch let error as NSError {
                print("Could not fetch Tags in Note :\(error)")
            }
        
        return [Tag]()
    }
    
}


