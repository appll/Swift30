//
//  ViewController.swift
//  TransitionDemo
//
//  Created by da ghua on 2020/4/24.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ToViewController.init()
        vc.content = "WoW === \(indexPath.row)"

//        self.navigationController?.pushViewController(vc, animated: true)
        if indexPath.row % 2 == 0 {
            self.navigationController?.lz_pushViewController(vc: vc)
        } else {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension UINavigationController {
    
    func lz_pushViewController(vc: UIViewController) {
        let animateDelegate = AnimateDelegate.init()
        self.delegate = (animateDelegate as UINavigationControllerDelegate)
        //此处需要将delegate交个目标vc，不然delegate对象会被释放掉，导致返回的动画失效
        vc.navigationControllerDelegate = animateDelegate
        self.pushViewController(vc, animated: true)
    }
}

extension UIViewController {
    
    var navigationControllerDelegate: UINavigationControllerDelegate? {
        get{
            return (objc_getAssociatedObject(self, "key") as? UINavigationControllerDelegate)
        }
        set {
            objc_setAssociatedObject(self, "key", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
