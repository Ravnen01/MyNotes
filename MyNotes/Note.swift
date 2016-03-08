//
//  Note.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {
    
    // FUNCTIONS
    
    
    
    enum SearchField : String{
        case Tags = "tags"
        case Pictures = "pictures"
        case Category = "category"
    }
    
    func searchByAttribute(field : SearchField, textSearched : String) -> [AnyObject]? {
        
        switch field {
            case .Tags :
                break
            
            case .Pictures :
                break
            
            case .Category :
                break
        }
        
        return [AnyObject]()
    }
    
    //PICTURES FUNCTIONS
    
    func addPhotos(photos : [Picture]){
        
        if let _ = self.pictures {
            
            if let currentPhotos : NSMutableSet = self.pictures!.mutableCopy() as? NSMutableSet {
                
                currentPhotos.addObjectsFromArray(photos)
                
                self.pictures = currentPhotos
            }
        } else {
            
            self.pictures = NSSet(objects: photos)
        }
        
    }
    
    func addPhoto(photo : Picture){
        addPhotos([photo])
    }
    
    func deleteAllPhotos(){
        
        self.pictures = nil
    }
    
    //TAGS FUNCTIONS
    
    func addTags(tags : [Tag]){
        
        if let _ = self.tags {
            if let currentTags : NSMutableSet = self.tags!.mutableCopy() as? NSMutableSet {
                
                currentTags.addObjectsFromArray(tags)
                
                self.tags = currentTags
            }
        } else {
            
            self.tags = NSSet(objects: tags)
        }
        
    }
    
    func addTag(tag : Tag){
        addTags([tag])
    }
    
    func deleteAllTags(){
        
        self.tags = nil
        
    }
    
    //CATEGORY FUNCTIONS
    
    
    
}