//
//  AtomicMaker.swift
//  AtomicMaker
//
//  Created by SEONGJUN on 2020/09/04.
//  Copyright © 2020 SEONGJUN. All rights reserved.
//

import Foundation

final class Atomic<T> {
    private let queue = DispatchQueue(label: "Atomic serial queue")
    
    private var _value: T
    
    init(_ value: T) {
        self._value = value
    }

    var value: T {
        get {
            return queue.sync { self._value }
        }
    }

    func mutate(_ transform: (inout T) -> ()) {
        queue.sync {
            transform(&self._value)
        }
    }
}
