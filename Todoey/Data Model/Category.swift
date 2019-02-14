//
//  Category.swift
//  Todoey
//
//  Created by James Ogila on 12/02/2019.
//  Copyright © 2019 James Ogila. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
