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
        
        let selectedTags = [Tag](tagSelection)
        
        myNote.tags = NSSet(array: selectedTags)
    }
    
    func autoUpdatePictures(myNote : Note, pictureSelection : [Picture]){
        
        let selectedPictures = [Picture](pictureSelection)
        
        myNote.pictures = NSSet(array: selectedPictures)
        
    }

}

