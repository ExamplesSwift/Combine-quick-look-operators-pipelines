import UIKit
import Combine

let answer = 41

let _ = Just(answer)
  .map { value -> String in
    switch value {
    case _ where value != 42:
      return "Absolutely wrong!"
    default:
      return "Correct! The answer to life, the universe, and everything!"
    }
}
  .sink { receivedValue in
    print("Your answer is \(receivedValue)")
}

let passthroughSubject = PassthroughSubject<String, Never>()

let subscription = passthroughSubject
.print("Example Debug: ")
  .sink { value in
    print("Got the value!")
}
passthroughSubject.send("42")
subscription.cancel()

let passthroughSubject12 = PassthroughSubject<Array<Int>, Never>()
let subscription2 = passthroughSubject12
  .allSatisfy { (values) in
    return values.allSatisfy { ($0) < 10 }
}.sink { satisfy in
  print("The accepted values satisfy the predicate: \(satisfy)");
}

passthroughSubject12.send([2, 6, 9, 10, 12, 15, 17, 20])
subscription2.cancel()



