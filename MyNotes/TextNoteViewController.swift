//
//  TextNoteViewController.swift
//  MyNotes
//
//  Created by iem on 10/02/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit
import CoreData


class TextNoteViewController: UIViewController {
    
    var parent:ViewProtocol?
    var note:Note?

    override func viewDidLoad() {
        super.viewDidLoad()
        title=note?.title
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func DoneButton(sender: AnyObject) {
        parent?.onCancelChildren()
    }
    @IBAction func SaveButton(sender: AnyObject) {
        parent?.onCancelChildren()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
