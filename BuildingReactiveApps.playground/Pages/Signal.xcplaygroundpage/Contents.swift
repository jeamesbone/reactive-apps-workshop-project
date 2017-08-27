import ReactiveSwift
import Result

//: # Signal
//: `pipe()` creates a signal that we can control
let (signal, input) = Signal<Int, NoError>.pipe()

//: We can observe the events through the signal's `observe` function
signal.observe { event in
    print(event)
}

//: We send events through the `input` observer
input.send(value: 1)
input.sendCompleted()

//: ----
//: ## Tasks
//: - Create a signal of a different type (e.g. String)
//: - Try observing at different points in time (before/after sending values)
//: - What happens if you send an event after completion of the signal?
//: - Observe multiple times
//: - Create a signal that has an error type (You can use `ExampleError`), try sending an error to the input






