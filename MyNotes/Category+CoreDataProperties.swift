//
//  Category+CoreDataProperties.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Category {

    @NSManaged var name: String?
    @NSManaged var dateUpdated: NSDate?
    @NSManaged var dateCreated: NSDate?
    @NSManaged var notes: NSSet?

}
