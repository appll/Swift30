//
//  ItemListViewControllerTests.swift
//  Swift04-TODOTests
//
//  Created by da ghua on 2020/3/23.
//  Copyright © 2020 da ghua. All rights reserved.
//

import XCTest

@testable import Swift04_TODO

class ItemListViewControllerTests: XCTestCase {

    var itemListVC: ItemListViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        itemListVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ItemListViewController") as! ItemListViewController)
        itemListVC.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(itemListVC.tableView)
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(itemListVC.tableView.dataSource)
        XCTAssertTrue(itemListVC.tableView.dataSource is ItemListDataProvider)
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(itemListVC.tableView.delegate)
        XCTAssertTrue(itemListVC.tableView.delegate is ItemListDataProvider)
    }
}
