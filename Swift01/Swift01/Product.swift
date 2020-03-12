//
//  Product.swift
//  Swift01
//
//  Created by da ghua on 2020/3/12.
//  Copyright © 2020 da ghua. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
}
