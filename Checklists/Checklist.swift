//
//  Checklist.swift
//  Checklists
//
//  Created by Yasuhiro on 09/09/2015.
//  Copyright (c) 2015 yasuhiroyoshida. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding {

  var name = ""
  var items = [ChecklistItem]()
  var iconName: String

  convenience init(name: String) {
    self.init(name: name, iconName: "No Icon")
  }

  init(name: String, iconName: String) {
    self.name = name
    self.iconName = iconName
    super.init()
  }

  required init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObjectForKey("Name") as! String
    items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
    iconName = aDecoder.decodeObjectForKey("IconName") as! String
    super.init()
  }

  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: "Name")
    aCoder.encodeObject(items, forKey: "Items")
    aCoder.encodeObject(iconName, forKey: "IconName")
  }

  func countUncheckedItems() -> Int {
    return reduce(items, 0) { cnt, item in cnt + (item.checked ? 1 : 0) }
  }
}
