//
//  ViewController.swift
//  IOSApprentice
//
//  Created by Novoda on 08/01/2019.
//  Copyright © 2019 cjm. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()
    
//    let row0text = "Walk the dog"
//    let row1text = "Brush teeth"
//    let row2text = "Learn iOS development"
//    let row3text = "Soccer practice"
//    let row4text = "Eat ice cream"
//
//    var row0checked = true
//    var row1checked = false
//    var row2checked = true
//    var row3checked = false
//    var row4checked = false

    //* its false here but the prototype is ticked, causes confuses and bugs

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)
    
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
    }
    }
    
    //* add this in to solve this, joins the data source to the table view prototype cell, table view calls this method before returning the cell
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
}

    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //for this table view "" (input), what is the cell for this row "e.g.5" (input)
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //for row (input) the cell is the table view cell 'checklist'
        
        let item = items[indexPath.row]
        
        //the label (which is this one 1000 in the prototype) in that row, will be as below
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        configureCheckmark(for: cell, at: indexPath)
        return cell
}
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//method called when tap- what happens (e.g 5th) row
       
        if let cell = tableView.cellForRow(at: indexPath) {
            
        
            // if tapped then convert it to the other
            let item = items[indexPath.row]
            item.checked = !item.checked
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
}