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
    var textField:UITextField=UITextField(frame:CGRectMake(0, 0, 10, 10))

    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
   
    var notes: [Note]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func addNotes(cate:String){
        let noteManager=NoteManager()
        let note=noteManager.createNote(cate, text: "")
        noteManager.appDelegate.saveContext()
        
        notes!.append(note!)
        tableView.reloadData()
    }

}

