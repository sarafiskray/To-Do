//
//  UITableViewController.swift
//  To-Do
//
//  Created by Saraf Ray on 3/28/20.
//  Copyright © 2020 skray. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemStore.createItem()
           // find position of item
        if let index = itemStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
               // insert new row
            tableView.insertRows(at: [indexPath], with: .automatic)
           }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
            if isEditing {
                // show editing mode
                sender.setTitle("Edit", for: .normal)
                // turn off editing mode
                setEditing(false, animated: true)
            } else {
                // end editing mode
                sender.setTitle("Done", for: .normal)
                // enter editing mode
                setEditing(true, animated: true)
            }
    }
    
    
    override func tableView(_ tableView: UITableView,
            numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
            for: indexPath)
      
        //nth item = row
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.urgency
    return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController
                        = segue.destination as! DetailViewController
                detailViewController.item = item
    } default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

}

