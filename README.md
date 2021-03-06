# AtomicMaker

- A Custom library which helps to make class properties have Objective-C's Atomic like attribute for multi-threading

```swift
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
```
