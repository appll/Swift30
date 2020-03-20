//
//  FBMeViewController.swift
//  Swift03-FaceBookMe
//
//  Created by da ghua on 2020/3/16.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class FBMeViewController: FBBaseViewController {
    
    typealias UserModel = [String : String]
    
    // MARK: Getter
    var userModel: FBMeUser {
        return FBMeUser.init(name: "BayMax", education: "CMU")
    }
    
    var tableDatasource: [[String: Any]] {
        return TableKeys.populate(withUser: userModel)
    }
    
    // MARK: 闭包给变量赋默认值
    private let tableView: UITableView = {
        let tbView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tbView.register(FBTableViewCell.self, forCellReuseIdentifier: FBTableViewCell.CellIdentifier)
        return tbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FaceBook"
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if #available(iOS 11, *) {
            let y = view.safeAreaInsets.top
            let height = view.bounds.height - y - view.safeAreaInsets.bottom
            tableView.frame = CGRect(x: 0, y: y, width: view.bounds.width, height: height)
        } else {
            let y = self.topLayoutGuide.length
            let height = view.bounds.height - y - self.bottomLayoutGuide.length
            tableView.frame = CGRect(x: 0, y: y, width: view.bounds.width, height: height)
        }
    }
}

extension FBMeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDatasource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableDatasource[section][TableKeys.Rows] as! [Any]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meCell: FBTableViewCell = tableView.dequeueReusableCell(withIdentifier: FBTableViewCell.CellIdentifier, for: indexPath) as! FBTableViewCell
        meCell.textLabel?.text = "Hah"
        return meCell
    }
    
    
}
