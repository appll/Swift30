//
//  ItemListViewController.swift
//  Swift04-TODO
//
//  Created by da ghua on 2020/3/23.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
