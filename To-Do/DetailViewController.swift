//
//  DetailViewController.swift
//  To-Do
//
//  Created by Saraf Ray on 3/28/20.
//  Copyright © 2020 skray. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descField: UITextField!
    @IBOutlet var urgencyField: UITextField!
    @IBOutlet var nameField: UITextField!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //var item: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        urgencyField.text = item.urgency
        descField.text = item.desc
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // save changes
        item.name = nameField.text ?? ""
        item.desc = descField.text  ?? ""
        item.urgency = urgencyField.text ?? ""
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }

}
