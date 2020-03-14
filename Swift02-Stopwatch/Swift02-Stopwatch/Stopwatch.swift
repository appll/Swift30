//
//  File.swift
//  Swift02-Stopwatch
//
//  Created by da ghua on 2020/3/14.
//  Copyright © 2020 da ghua. All rights reserved.
//

import Foundation

struct Stopwatch {
    var counter: Double
    var timer: Timer
    
    init() {
        counter = 0.0
        timer = Timer()
    }
}
