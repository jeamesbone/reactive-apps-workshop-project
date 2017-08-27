import ReactiveSwift
import Result
import PlaygroundSupport

//: # Signal Producer

//: Create a signal producer
let producer = SignalProducer<Int, NoError> { input, disposable in
    input.send(value: 1)
    input.send(value: 2)
    input.send(value: 3)
    input.sendCompleted()
}

//: We can start the producer with `start()`
producer.start { event in
    print(event)
}

//: ----

//: ## Tasks
//: - Try creating your own producer
//: - Try starting the producer multiple times
//: - Try the other start functions (e.g. `startWithValues`)








