//
//  ViewController.swift
//  CheckItOff3
//
//  Created by Douglas Goodwin on 6/1/16.
//  Copyright © 2016 Dr.G. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lastChanceTable: UITableView!
    @IBOutlet weak var thisWeekTable: UITableView!
    @IBOutlet weak var itemsTable: UITableView!
    @IBOutlet weak var lastChanceCount: UILabel!
    @IBOutlet weak var thisWeekCount: UILabel!
    
    var lastChance: [Items] = []
    var items: [Items] = []
    var thisWeek: [Items] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = UIColor.groceryBlueColor()
        
        lastChanceTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        thisWeekTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    func refresh(){
        items = CoreDataDetails.getData("Items") as! [Items]
        lastChance = CoreDataDetails.getData("Items", predicate: NSPredicate(format:"completeBy<=%@", (NSDate()))) as! [Items]
        
        let dayComponent = NSDateComponents()
        dayComponent.day = 7
        let calendar = NSCalendar.currentCalendar()
        let nextDate = calendar.dateByAddingComponents(dayComponent, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0))
        thisWeek = CoreDataDetails.getData("Items", predicate: NSPredicate(format:"completeBy<%@", (nextDate)!)) as! [Items]
        
        lastChanceTable.reloadData()
        thisWeekTable.reloadData()
        itemsTable.reloadData()
    }

    //MARK: TableViewDataSource Protocols and Stuff
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == lastChanceTable) {
            lastChanceCount.text = String(lastChance.count)
            return lastChance.count
        }
        else if (tableView == thisWeekTable) {
            thisWeekCount.text = String(thisWeek.count)
            return thisWeek.count
        } else {
            return items.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(tableView == lastChanceTable) {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            let item = lastChance[indexPath.row]
            cell.textLabel!.text = String(format: "%@: %@", item.listItem!, item.completeBy!)
            
            return cell
        }
        else if (tableView == thisWeekTable) {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            let item = thisWeek[indexPath.row]
            cell.textLabel!.text = String(format: "%@: %@", item.listItem!, item.completeBy!)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! tableViewCellTableViewCell
            let item = items[indexPath.row]
            cell.textLabel!.text = String(format: "%@: %@", item.listItem!, item.completeBy!)
            cell.checkbox.text = "◻️"
            if(item.done == true) {
                cell.checkbox.text = "☑️"
            }
            
            return cell
        }
    }

}

