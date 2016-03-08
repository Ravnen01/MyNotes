//
//  CategoryViewController.swift
//  MyNotes
//
//  Created by iem on 03/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var textField:UITextField=UITextField(frame:CGRectMake(0, 0, 10, 10))
    
    var appDelegate: AppDelegate{
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
    
    var categories: [Category]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        categories=CategoryManager().fetchCategory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let category=categories![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text=category.name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    @IBAction func newAction(sender: AnyObject) {
        let alert=UIAlertController(title: "Categorie", message: "Ajouter une categorie", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler(configurationTextField)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: handleCancel))
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction)in self.addCategorie(self.textField.text!)}));
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    func handleCancel(alertView:UIAlertAction!){
        
    }
    func configurationTextField(textField:UITextField!){
        if let _ = textField{
            self.textField=textField!
        }
    }
    func addCategorie(cate:String){
        let categoryManager=CategoryManager()
        let categorie=categoryManager.createCategory(cate)
        categoryManager.appDelegate.saveContext()
        
        categories!.append(categorie!)
        tableView.reloadData()
    }
    
}
