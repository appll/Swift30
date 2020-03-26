//
//  ItemListDataProvider.swift
//  Swift04-TODO
//
//  Created by da ghua on 2020/3/23.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

enum Section: Int {
    case ToDo
    case Done
}

class ItemListDataProvider: NSObject {
    
    var itemDataManager: ItemListDataManager?
    
    override init() {
        super.init()
        itemDataManager = ItemListDataManager()
    }
}

extension ItemListDataProvider: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataManager = itemDataManager else {
            return 0
        }
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        
        let numberOfRow: Int
        
        switch section {
        case .ToDo:
            numberOfRow = dataManager.todoItems.count
        case .Done:
            numberOfRow = dataManager.doneItems.count
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
}
