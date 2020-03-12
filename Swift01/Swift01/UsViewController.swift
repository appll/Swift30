//
//  UsViewController.swift
//  Swift01
//
//  Created by da ghua on 2020/3/12.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class UsViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        if #available(iOS 11, *) {
            let safeTop = view.safeAreaInsets.top
            let safeBottom = view.safeAreaInsets.bottom
            scrollView.frame = CGRect(x: 0, y: safeTop, width: view.frame.width, height: view.frame.height - safeBottom - safeTop)
        } else {
            let safeTop = topLayoutGuide.length
            let safeBottom = bottomLayoutGuide.length
            scrollView.frame = CGRect(x: 0, y: safeTop, width: view.frame.width, height: view.frame.height - safeBottom - safeTop)
        }
        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
    }

}
