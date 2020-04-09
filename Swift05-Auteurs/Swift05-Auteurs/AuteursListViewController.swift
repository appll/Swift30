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
    }
}

extension AuteursListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auteurs?.auteurs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if let auteur = auteurs?.auteurs[indexPath.row] {
            cell.textLabel?.text = auteur.bio
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController.init()
        vc.view.backgroundColor = .white
        vc.title = "111"
        navigationController?.pushViewController(vc, animated: true)
    }
}
