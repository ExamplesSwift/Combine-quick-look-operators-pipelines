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


