//
//  AuteurDetailViewController.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/15.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class AuteurDetailViewController: UIViewController {
    
    var films: [Film]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }

}

extension AuteurDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let filmList = films else {
            return 0
        }
        return filmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmCell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as! AuteurFilmCell
        if let filemModel = films?[indexPath.row] {
            filmCell.fileImageView.image = UIImage(named: filemModel.poster)
            filmCell.fileNameLabel.text = filemModel.title
            filmCell.detailTextView.text = filemModel.isExpand ? filemModel.plot : "Tap For Details >"
            
            filmCell.detailTextView.textAlignment = filemModel.isExpand ? .left : .center
            filmCell.detailTextView.textColor = filemModel.isExpand ? UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) : .red
        }
        return filmCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectCell = tableView.cellForRow(at: indexPath) as? AuteurFilmCell else {
            return
        }
        if var filemModel = films?[indexPath.row] {
            filemModel.isExpand = !filemModel.isExpand
            //FIXME: 这里要格外注意，由于strut是值类型，需要更新到数据源中
            films?[indexPath.row] = filemModel
            selectCell.detailTextView.text = filemModel.isExpand ? filemModel.plot : "Tap For Details >"
            selectCell.detailTextView.textAlignment = filemModel.isExpand ? .left : .center
            selectCell.detailTextView.textColor = filemModel.isExpand ? UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) : .red
            //MARK: 更新cell高度变化
            tableView.beginUpdates()
            tableView.endUpdates()
            //MARK: 滚动选择的cell到顶部
            tableView .scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
}
