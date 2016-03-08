//
//  NoteManager.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData


class NoteManager: NSObject {

    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var managedObjectContext: NSManagedObjectContext{
        
        return appDelegate.managedObjectContext
    }
    
    
    func fetchNotes() -> [Note]?{
        
        let fetchRequest=NSFetchRequest(entityName: "Note")
        let sortDescriptor=NSSortDescriptor(key:"title",ascending: true)
        let dateSortDescriptor = NSSortDescriptor(key: "dateCreated", ascending: true)
        fetchRequest.sortDescriptors=[sortDescriptor,dateSortDescriptor]
        
        do{
            let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Note]
            return result
        }catch let error as NSError{
            print("Could not fetch Notes : \(error)")
        }
        
        
        
        return [Note]()
    }
    
    func createNote(title: String, categorie:Category)->Note?{
        let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: managedObjectContext)
        let note = NSManagedObject(entity:entity!,insertIntoManagedObjectContext: managedObjectContext) as! Note
        note.title=title
        note.category=categorie
        //note.text=text
        return note
    }
    
    func searchText(search:String?)->[Note]?{
        if let _=search {
            
            let fetchRequest=NSFetchRequest(entityName: "Note")
            let sortDescriptor=NSSortDescriptor(key:"title",ascending:true)
            let textSortDescriptor = NSSortDescriptor(key: "text", ascending: true)
            fetchRequest.sortDescriptors=[sortDescriptor,textSortDescriptor]
        
            let predicate = NSPredicate(format: "(title contains %@) OR (text contains %@)", search!, search!)
            fetchRequest.predicate=predicate;
        
            do{
                let result = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Note]
                return result
            }catch let error as NSError{
                print("Could not fetch Notes : \(error)")
            }
            
        }
        return [Note]()
        
    }

}
