//
//  AddNewItemViewController.swift
//  CheckItOff3
//
//  Created by Douglas Goodwin on 6/2/16.
//  Copyright © 2016 Dr.G. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var dateDuePicker: UIDatePicker!
    var dateDue:NSDate = NSDate()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 42/255, green: 182/255, blue: 200/255, alpha: 1.0)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(colorLiteralRed: 241/255, green: 233/255, blue: 193, alpha: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveButtonTapped() {
        CoreDataDetails.save(listItem.text!, completeBy: dateDue, done: false)
        
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
        
    }
    
    @IBAction func dateChanged(sender: AnyObject) {
        dateDue = dateDuePicker.date
        
    }

}
