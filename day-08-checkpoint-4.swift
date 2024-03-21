import Cocoa

enum NumberError: Error {
    case OutOfRange, NoRoot
}

func getSquareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw NumberError.OutOfRange
    }
    
    var squareRoot = Int()
    var squareRootFound = false
    
    for i in 1...100 {
        if i * i == number {
            squareRootFound = true
            squareRoot = i
            break
        }
    }
    
    if squareRootFound == false {
        throw NumberError.NoRoot
    }
    
    print("Square Root of \(number): \(squareRoot)")
    return squareRoot
}

let squareRoot = 69

do {
    try getSquareRoot(squareRoot)
} catch NumberError.OutOfRange {
    print("Your number is out of range. Please pick a number between 1 and 10,000.")
} catch NumberError.NoRoot {
    print("No square root found for \(squareRoot)")
}
