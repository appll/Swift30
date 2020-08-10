//
//  AnimateDelegate.swift
//  TransitionDemo
//
//  Created by da ghua on 2020/4/24.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class AnimateDelegate: NSObject {

    deinit {
        print("AnimateDelegate deinit---")
    }
}

extension AnimateDelegate: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var animatedTransitioning: UIViewControllerAnimatedTransitioning?
        
        switch operation {
        case .push:
            animatedTransitioning = AnimationTiltBegin.init()
        case .pop:
            animatedTransitioning = AnimationTildEnd.init()
        default:
            animatedTransitioning = nil
        }
        return animatedTransitioning
    }
}
