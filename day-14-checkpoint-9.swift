// Checkpoint 9
// Will return a single Int if at least one exists in the array passed in
// Otherwise will return a random number between 1 and 100 if either
//   the array doesn't exist (nil) or exist but is empty.

import Cocoa

func getRandomNumber(from numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

var myIntegers: [Int]? = [9, 24, 42, 69, 17]
var randomNumber = getRandomNumber(from: nil)
print(randomNumber)

randomNumber = getRandomNumber(from: myIntegers)
print(randomNumber)
