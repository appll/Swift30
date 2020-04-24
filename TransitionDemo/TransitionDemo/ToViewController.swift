//
//  ToViewController.swift
//  TransitionDemo
//
//  Created by da ghua on 2020/4/24.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ToViewController: UIViewController {

    var content: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(label)
        label.text = content ?? "defalut"
    }

}
