//
//  ProductsTableViewController.swift
//  Swift01
//
//  Created by da ghua on 2020/3/12.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]?
    let cellIdentifier = "CellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = [
            Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
            Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
            Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
            Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
          ]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        self.view.backgroundColor = UIColor.lightGray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushDetail" {
            if let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell),
                let pDetailVC = segue.destination as? ProductDetailViewController {
                pDetailVC.product = products?[indexPath.row]
            }
        }
    }
}

extension ProductsTableViewController {
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if let _ = cell {
            
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        guard let sProducts = products else { return cell!}
        let product = sProducts[indexPath.row]
        if let imgName =  product.cellImageName {
            cell?.imageView?.image = UIImage.init(named: imgName)
        }
        cell?.textLabel?.text = product.name ?? "defaul"
        return cell!
    }

}
