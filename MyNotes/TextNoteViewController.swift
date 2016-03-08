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

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title=note?.title
        textView.text = note?.text
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
        note?.text = textView.text
        NoteManager().appDelegate.saveContext()
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

extension TextNoteViewController : UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        
        print("New text \(textView.text)")
    
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if(textView.text! == "Tapez votre texte...") {
            textView.text = ""
        }
    }
}