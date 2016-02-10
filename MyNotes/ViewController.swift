//
//  ViewController.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
   
    var notes: [Note]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let noteManager=NoteManager()
        
        noteManager.createNote("First Note", text:"First Text")
        noteManager.createNote("Second Note", text:"First Text")
        noteManager.createNote("Therd Note", text:"First Text")
        noteManager.createNote("for Note", text:"First Text")
        noteManager.appDelegate.saveContext()
        
        notes=NoteManager().fetchNotes()
        
        // fonction à créer
        
//        let selectedTags = [Tag]()
//        
//        let note = notes![0]
//        
//        note.tags = NSSet(array: selectedTags)
        
        //

        
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let note=notes![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text=note.title
        cell?.detailTextLabel?.text=note.title
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func autoUpdateTags(myNote : Note, tagSelection : [Tag]){
        
        myNote.tags = NSSet(array: tagSelection)
    }
    
    func autoUpdatePictures(myNote : Note, pictureSelection : [Picture]){
        
        myNote.pictures = NSSet(array: pictureSelection)
        
    }
    
//    if let _ = self.pictures {
//        
//        if let currentPhotos : NSMutableSet = self.pictures!.mutableCopy() as? NSMutableSet {
//            
//            currentPhotos.addObjectsFromArray(photos)
//            
//            self.pictures = currentPhotos
//        }
//    } else {
//    
//    self.pictures = NSSet(objects: photos)
//    }



}

