//
//  Item.swift
//  To-Do
//
//  Created by Saraf Ray on 3/28/20.
//  Copyright © 2020 skray. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(desc, forKey: "desc")
        coder.encode(urgency, forKey: "urgency")
        coder.encode(dateCreated, forKey: "dateCreated")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        dateCreated = coder.decodeObject(forKey: "dateCreated") as! Date
        desc = (coder.decodeObject(forKey: "desc") as! String)
        urgency = (coder.decodeObject(forKey: "urgency") as! String?)!
        super.init()
    }
    
    var name: String
    var desc: String?
    var urgency: String
    let dateCreated: Date
    
    init(name: String, desc: String?, urgency: String) {
        self.name = name
        self.desc = desc
        self.urgency = urgency
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let actions = ["Do", "Make", "Clean"]
            let things = ["Bed", "Clothes", "Dishes"]
            
            var idx = arc4random_uniform(UInt32(actions.count))
            let randomAction = actions[Int(idx)]
            
            idx = arc4random_uniform(UInt32(things.count))
            let randomThing = things[Int(idx)]
            
            let randomName = "\(randomAction) \(randomThing)"
            
            self.init(name: randomName, desc: "", urgency: "Low")
            
        } else {
            
            self.init(name: "", desc: "", urgency: "")
        }
    }
    
   
}

