//
//  ItemListDataProviderTests.swift
//  Swift04-TODOTests
//
//  Created by da ghua on 2020/3/24.
//  Copyright © 2020 da ghua. All rights reserved.
//

import XCTest
@testable import Swift04_TODO

class ItemListDataProviderTests: XCTestCase {

    var itemListDataProvider: ItemListDataProvider!
    var tableView: UITableView!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        itemListDataProvider = ItemListDataProvider()
        tableView = UITableView()
        tableView.dataSource = itemListDataProvider
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSection_IsTwo() {
        let section = tableView.numberOfSections
        itemListDataProvider.itemDataManager?.addItem(ToDoItem(name: "sss"))
        XCTAssertEqual(section, 2)
    }
    
    func testNumberRowsInFirstSection_isToDoCount() {
        itemListDataProvider.itemDataManager?.addItem(ToDoItem(name: "app"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        itemListDataProvider.itemDataManager?.addItem(ToDoItem(name: "pdd"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

}
