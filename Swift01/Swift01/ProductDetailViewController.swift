//
//  ProductDetailViewController.swift
//  Swift01
//
//  Created by da ghua on 2020/3/12.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {


    var product: Product?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = product?.name
        if let imgName = product?.fullscreenImageName {
            imageView.image = UIImage(named: imgName)
        }
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    @objc private func addButtonAction() {
        print("addButtonActio --- ")
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
