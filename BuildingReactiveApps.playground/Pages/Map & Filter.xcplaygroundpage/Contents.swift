//: # Map & Filter

import ReactiveSwift
import Result

let countingProducer = SignalProducer<Int, NoError>([1, 2, 3, 4, 5])

print("MAP")
countingProducer
    .map { $0 * 10 }
    .startWithValues { print($0) }

print("FILTER")
countingProducer
    .filter { $0 > 2 }
    .startWithValues { print($0) }

//: ----

//: ## Tasks
//: 1. String Representation - ["1", "2", "3", "4", "5"]
//: 2. Even Numbers - [2, 4]
//: 3. Even Numbers * 5 - [10, 20]
//: 4. Odd Strings - ["Odd - 1", "Odd - 3", "Odd - 5"]









