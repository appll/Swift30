//
//  AuteursListViewController.swift
//  Swift05-Auteurs
//
//  Created by da ghua on 2020/4/7.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class AuteursListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var auteurs: Auteurs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AureursList"
        // Do any additional setup after loading the view.
        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
        auteurs = Auteurs.auteursModel()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let cell = sender as? AuteursListCell,
            let indexPath = tableView.indexPath(for: cell),
            let auteurDetailVC = segue.destination as? AuteurDetailViewController,
            let auteur = auteurs?.auteurs[indexPath.row] else{
                return
        }
        auteurDetailVC.films = auteur.films
    }
}

extension AuteursListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auteurs?.auteurs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuteursListCell", for: indexPath) as! AuteursListCell
        cell.contentLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        cell.headImageView.layer.cornerRadius = cell.headImageView.frame.width / 2.0
        if let auteur = auteurs?.auteurs[indexPath.row] {
            cell.contentLabel.text = auteur.bio
            cell.headImageView.image = UIImage(named: auteur.image)
            cell.nameLabel.text = auteur.name
            cell.sourceLabel.text = auteur.source
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIViewController.init()
//        vc.view.backgroundColor = .white
//        vc.title = "111"
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
