//
//  ItemListDataManager.swift
//  Swift04-TODO
//
//  Created by da ghua on 2020/3/24.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ItemListDataManager: NSObject {

    var todoItems: [ToDoItem] = []
    var doneItems: [ToDoItem] = []
    
    func addItem(_ item: ToDoItem) {
        todoItems.append(item)
    }
    
    func todoItemCounts() -> Int{
        return todoItems.count
    }
}
