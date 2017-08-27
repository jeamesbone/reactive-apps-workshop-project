//: # FlatMap

import ReactiveSwift
import Result

let countingProducer = SignalProducer<Int, NoError>([1, 2, 3, 4, 5])

func createEmojis(_ number: Int) -> SignalProducer<String, NoError> {
    var s = ""
    for _ in 0..<number {
        s += "😀"
    }
    return SignalProducer<String, NoError>(value: s)
}

countingProducer
    .flatMap(.merge, createEmojis)
    .startWithValues { print($0) }
