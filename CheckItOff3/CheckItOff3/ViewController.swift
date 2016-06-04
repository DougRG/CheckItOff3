//
//  ViewController.swift
//  CheckItOff3
//
//  Created by Douglas Goodwin on 6/1/16.
//  Copyright © 2016 Dr.G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lastChanceTable: UITableView!
    @IBOutlet weak var thisWeekTable: UITableView!
    @IBOutlet weak var itemsTable: UITableView!
    @IBOutlet weak var lastChanceCount: UILabel!
    @IBOutlet weak var thisWeekCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = UIColor.groceryBlueColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

