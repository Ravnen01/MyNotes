//
//  ViewController.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewProtocol {
    
    var parent:ViewProtocol?
    var categorie:Category?
    
    @IBOutlet weak var tableView: UITableView!
    var textField:UITextField=UITextField(frame:CGRectMake(0, 0, 10, 10))

    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
   
    var notes: [Note]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title=categorie?.name
        notes=categorie?.notes?.allObjects as! [Note]
        
        // fonction à créer
        
//        let selectedTags = [Tag]()
//        
//        let note = notes![0]
//        
//        note.tags = NSSet(array: selectedTags)
        
        //

        
    }
    
    //MARK: UITableViewDataSource
    
    @IBAction func DoneButton(sender: AnyObject) {
        parent?.onCancelChildren()
    }
    
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
    
    func autoUpdateTags(myNote : Note, tagSelection : [Tag]){
        
        myNote.tags = NSSet(array: tagSelection)
    }
    
    func autoUpdatePictures(myNote : Note, pictureSelection : [Picture]){
        
        myNote.pictures = NSSet(array: pictureSelection)
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*let affichageController = self.storyboard?.instantiateViewControllerWithIdentifier("TextNote") as! TextNoteViewController
        navigationController!.pushViewController(affichageController, animated: true)*/
    }

    @IBAction func addNote(sender: AnyObject) {
        let alert=UIAlertController(title: "Note", message: "Ajouter une Note", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler(configurationTextField)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: handleCancel))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction)in self.addNotes(self.textField.text!)}));
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleCancel(alertView:UIAlertAction!){
        
    }
    
    func configurationTextField(textField:UITextField!){
        if let _ = textField{
            self.textField=textField!
        }
    }
    
    func addNotes(text:String){
        let noteManager=NoteManager()
        let note=noteManager.createNote(text, categorie: categorie!)
        noteManager.appDelegate.saveContext()
        
        notes!.append(note!)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="NoteToText"{
            let itemSelected=tableView.indexPathForCell(sender as!UITableViewCell)?.row
            let NavigationController=segue.destinationViewController as! UINavigationController
            let destination=NavigationController.viewControllers[0] as! TextNoteViewController
            destination.parent=self
            destination.note=notes![itemSelected!]
        }
    }
    
    func onCancelChildren() {
        self.dismissViewControllerAnimated(true, completion: {})
    }

}

