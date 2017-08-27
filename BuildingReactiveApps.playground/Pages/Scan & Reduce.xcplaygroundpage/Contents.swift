//: # Scan & Reduce

import ReactiveSwift
import Result

let countingProducer = SignalProducer<Int, NoError>([1, 2, 3, 4, 5])

print("REDUCE")
countingProducer
    .reduce(0, +)
    .startWithValues { print($0) }

print("SCAN")
countingProducer
    .scan(0, +)
    .startWithValues { print($0) }

//: ----

//: ## Tasks
//: Using Reduce:
//: 1. Send a signal string on completion - "12345"
//: 2. Send a single array on completion - [1, 2, 3, 4, 5]
//: 3. Send a single dictionary on completion - [1: "1", 2: "2", 3: "3", 4: "4", 5: "5"]
//: Using Scan
//: 4. Rolling Average - 1, 1.5, 2, 2.5, 3

